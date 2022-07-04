Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D7565428
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:54:13 +0200 (CEST)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Kea-0004rd-2C
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KYW-00064T-I8
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KYT-0002ci-H7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQFhp5idyPSoD5cGcN6RMpugUyXUa9Yl0obA0ACBh90=;
 b=eTe/yIrX2v0EDPZxcqUfg2qDh4MK2NQzXdRZyXXlcWsv3sNymdQGvNpBvpBjvcKMQwv0Xb
 IIkykrFX3iIHigg0FQicJeV5ql9W41//fPAhlCKbuCxFSa7BXVrqJ1xs6MRZkohIFvwQEy
 xg/oPxaxTk76LZ/bxK/TGRtlrSuGjWo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-ygFyX6sJOfG-PWUlxH39lQ-1; Mon, 04 Jul 2022 07:47:51 -0400
X-MC-Unique: ygFyX6sJOfG-PWUlxH39lQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 z19-20020a05640240d300b00437633081abso7011366edb.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GQFhp5idyPSoD5cGcN6RMpugUyXUa9Yl0obA0ACBh90=;
 b=To7FTV8qhTg8W9QLADE7dgi6ioabv7ulyYQvpYM9R44Zg/bQPn5SaecwvPp0wHkp4y
 mxhoWtG7QRwlaBi/1JhVMOwKeG7wy7fRt5UgMQ1CA4hty72Qhae3Hx25A35nfqHUwWGF
 NYxH69KufNwpoeawJ3dgOdj8EONCfEfwfUB2qTixmSZeAAkSNfnsn9/vvmNfBmxsKAjG
 iI8t3frFX47pe4/DK1sbi+qPcUPWXVcQgqsCkYdrfbb9a63uNzFQEAlPETCpK5jmw562
 yjwm56cFtbqDO2XP//J/OvS8jRBfTqsMshNEFEq1Y0n0+02zBNyTVP5zRK1QrupUFzhX
 Z9wA==
X-Gm-Message-State: AJIora8gqDQdtq6omSp6VHgMjSBXO+kt6TxzYR74F7Tv8UoQ0lpG+ow9
 xMybu3vExbvznHHEwU7gh7T3SBMl+fLLQN0TyaEnhGZka5WxLUQEhM+zNNkQx3uKnohT7Epnts/
 IXP5S+6ABRdLSilA=
X-Received: by 2002:a17:907:9005:b0:718:391:45e with SMTP id
 ay5-20020a170907900500b007180391045emr28694279ejc.616.1656935270164; 
 Mon, 04 Jul 2022 04:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sWngkO+eMJ8lPNZuJ3GLsYZ8FhryfNUFwXdA+FAwNrh1gyh1vZoyww6Xngt6AVGPB6KGOCLw==
X-Received: by 2002:a17:907:9005:b0:718:391:45e with SMTP id
 ay5-20020a170907900500b007180391045emr28694249ejc.616.1656935269939; 
 Mon, 04 Jul 2022 04:47:49 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170906500f00b00722dceb3f8bsm14153104ejj.151.2022.07.04.04.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:47:49 -0700 (PDT)
Message-ID: <e146e3ca-f3c2-6930-fb4d-0877d071b39b@redhat.com>
Date: Mon, 4 Jul 2022 13:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 06/10] block: Make 'bytes' param of
 bdrv_co_{pread,pwrite,preadv,pwritev}() an int64_t
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-7-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-7-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 17:27, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement bdrv_{pread,pwrite}() using generated_co_wrapper.
>
> unsigned int fits in int64_t, so all callers remain correct.
>
> bdrv_check_request32() is called further down the stack and causes -EIO
> to be returned if 'bytes' is negative or greater than
> BDRV_REQUEST_MAX_BYTES, which in turns never exceeds SIZE_MAX.

I’m not a huge fan of that reasoning alone.  I don’t like generating an 
object that will be invalid if `bytes > SIZE_MAX`, and then rely on some 
later check in a different context verifying that `bytes <= SIZE_MAX`.  
In theory, if the latter check is removed, we might forget caring for 
the former.  (In practice, such a case (where I/O vectors remain using 
size_t, but we allow for larger overall requests) is difficult to 
imagine, though.)

However, bdrv_check_request32() also calls bdrv_check_qiov_request(), 
which verifies the integrity of qiov by checking that `bytes` will not 
exceed `qiov->size - qiov_offset`.  So if we had any overflow when 
casting `bytes` to `size_t`, it’ll be seen there directly (and I don’t 
see why we’d remove that specific check).

Given that, and given that there’s precedent (e.g. bdrv_pread()), I’m OK 
with the change.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


