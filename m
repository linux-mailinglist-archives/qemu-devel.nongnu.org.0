Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC79559FAF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:31:34 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4n9X-0000jd-Qn
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o4myb-00011U-3N
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o4myX-0000Lf-R2
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656091208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLFBzZolx6FmO1TFToaVLyL/HbAKc9EGfn6uDPGZgPU=;
 b=KS0OqxtgH3ft+E0V8ZagGhaslR3NnlfkCTDf+8YWkA42WCeRwMpAsG0Y9jCdKh22+L+Fsh
 ZMRDJVHQyEG7tutbvAogSaR3W4ge3b3M2dmHG41Ifu68+KJKy+ronSGRAnjOmg8SXKY2S3
 87o02aaHOL9kofT7cSQjUg02SCWcAuA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-atpgp6odPEqGl4ETrjC7jw-1; Fri, 24 Jun 2022 13:20:06 -0400
X-MC-Unique: atpgp6odPEqGl4ETrjC7jw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b7-20020a056402350700b00435bd1c4523so2311089edd.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLFBzZolx6FmO1TFToaVLyL/HbAKc9EGfn6uDPGZgPU=;
 b=1FO/1gM+jhoxICXvsFykmtumZk8Kwl/yeqq6eOoSetLkXaeb8C9vHAFkz0yzFa3Q7k
 NYlJAewQRGezzbPHG4f+rsO3u8w/XM6CjBoPJUByNGQUDEPQaSSq+tlkZ8K1yxrTIXW3
 pIHEXuaYHIiIFWFHIuz8czKfZ8zbzgIMqQsojCNcVU2MObaDVWQ/jW9wZ1qpO6OC137/
 a3fKhT1t1g30pOju2VqPuZ1ZYlw/RxryhMBtXB+qzaemISIISyEoF8BD9eHTCpxQXfMG
 avrq6XIgdHsuSaxcmIafIWPzbJWulTIfk5JZuPOnP87PbGxBHepUAC04SCz88E6XZYqF
 7W+Q==
X-Gm-Message-State: AJIora/aZkSdAROzSmrRAGulHSnsyp4rtTtLIs8foLgs2hGUoLcSIodH
 ptgWzx9y0w7N75plqSS8aYov0u37r5WJIp2YraNdq/yoAA+dTj8Ns80SNYHW0jhVet96CAv5wqe
 k5Fzl8ZAdfbmnFLE=
X-Received: by 2002:a17:906:149b:b0:726:2968:e32a with SMTP id
 x27-20020a170906149b00b007262968e32amr25255ejc.71.1656091205468; 
 Fri, 24 Jun 2022 10:20:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/9YZqiDZscapDRUeFP/YLFOtrrScpadalsLdJxyLSgzRULXYqwzcoPP/9Z+Pyu4+/fY9kBw==
X-Received: by 2002:a17:906:149b:b0:726:2968:e32a with SMTP id
 x27-20020a170906149b00b007262968e32amr25232ejc.71.1656091205250; 
 Fri, 24 Jun 2022 10:20:05 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a1709060ddb00b00722e559ee66sm1400809eji.62.2022.06.24.10.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 10:20:04 -0700 (PDT)
Message-ID: <5ab551b1-d25b-9cd6-9b74-bcf77bdda731@redhat.com>
Date: Fri, 24 Jun 2022 19:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 10/18] jobs: rename static functions called with
 job_mutex held
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-11-eesposit@redhat.com>
 <c0401616-f246-ce1d-2a0f-b7e23dd55ab8@yandex-team.ru>
 <0aaa344b-aecb-13de-f82f-cad27a768ba9@redhat.com>
 <c234668d-0156-548b-e1e8-d1fda1b85ad7@yandex-team.ru>
 <f59f2894-667c-8940-cc34-2407783b5699@redhat.com>
 <be74272f-f22b-f649-c299-deed65699e2f@yandex-team.ru>
 <b420f70a-6e69-1913-5019-05a8118a49f5@redhat.com>
 <YrXKRWO7tQ9yvFKI@redhat.com>
 <d39ec22a-938d-d32a-bcd3-8f5cedb7b23c@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <d39ec22a-938d-d32a-bcd3-8f5cedb7b23c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 24/06/2022 um 17:28 schrieb Paolo Bonzini:
> On 6/24/22 16:29, Kevin Wolf wrote:
>> Yes, I think Vladimir is having the same difficulties with reading the
>> series as I had. And I believe his suggestion would make the
>> intermediate states less impossible to review. The question is how much
>> work it would be and whether you're willing to do this. As I said, if
>> reorganising is too hard, I'm okay with just ignoring the intermediate
>> state and reviewing the series as if it were a single patch.
> 
> I think we've tried different intermediate states for each of the
> previous 6 versions, and none of them were really satisfactory. :(
> 

Yes. v7 in this case basically means that we tried at least 4-5 times to
reorganize patches.

Nevertheless I could give it a try. I just hope I won't regret it :)

If I don't manage, I will just give up and re-send the serie with
Vladimir's nitpicks.

But yeah, I guess we all agree that this is the last time I reorganize
this serie.

Feedback are always very well welcome, but not anymore on reordering
please ;)

Thank you,
Emanuele


