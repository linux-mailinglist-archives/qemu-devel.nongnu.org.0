Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D05A30A4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:52:56 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRgJy-0002U6-QN
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRgGr-0000zE-7Y
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRgGn-0002Ax-8i
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661546976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNGBu+nYW43VXu53Z7CA9ApCO54TGUpHk18kTsyxrG0=;
 b=YnJ2C0otOwpOCtPmOEqEXofjDthWBqD/TuH300Bur+m/4gDf2qatjRkr6TwlaTbTa7mRxP
 TbE+ws/YZujWJ3wx6UIqOATVeJGwu6SZyacV6QsTdpiQEJhbo7zk5IlZUoETqL5mFa7Gql
 RU1Yqw8TET3oay0TD6p/tR/O9q7t2hM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-UCyV1RfXOi2-aAH1H3ToIw-1; Fri, 26 Aug 2022 16:49:34 -0400
X-MC-Unique: UCyV1RfXOi2-aAH1H3ToIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so4551892wma.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NNGBu+nYW43VXu53Z7CA9ApCO54TGUpHk18kTsyxrG0=;
 b=I0+b1kbCkXGAw0Qy8qYHOHydwgfVxwoaudrXKVloBNL2POlarXKIJ1RW+lqz0Q/UuL
 mazF8/RvmWcKVgS4f/kyQDxzWWPt46Xl2JC0IK0JC+eSB79CX9+VxR0Lg6NiWEBGA/ON
 NoialnxcOmKo3d4qnUq5EzP6zgN2jHvnE8osrgC+h+SrwyPYFGQE/zur2Q0ojRrhh27G
 +PE7Na8zkPXWRWltCo6Zz5u+rqYxeGyitF+iDJ8eGPGjvNw/8FEFiMWYU/uRkEgbxPI7
 Xd0/Xd+evhGXYUoENdlos2IDXqq6JTSSt4saH5ehhHx+S4pR4Y6LNbWB4NkpjJJZZx6J
 mI3A==
X-Gm-Message-State: ACgBeo0Q9RaWj3Kxngr7hm4dhezHwZk7h9WtIBKXOCVPbgM0HIkh+Mp6
 tcQBX8CJ76TVxKvxgKO3ERDGREDZPNfzxogXv4oUtmDX0VuIZxUCrCawiJ55B4tZ56kHWvqCxnW
 9c1xut7GF1UEujHw=
X-Received: by 2002:a05:600c:1da3:b0:3a5:c1ea:cd98 with SMTP id
 p35-20020a05600c1da300b003a5c1eacd98mr732563wms.174.1661546973830; 
 Fri, 26 Aug 2022 13:49:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Q48XbOTetCLfvGd78hebFYRgmggcoACMlXvXAx95DNi787UJqUwFybdyXbdZOPlLxU8/c3w==
X-Received: by 2002:a05:600c:1da3:b0:3a5:c1ea:cd98 with SMTP id
 p35-20020a05600c1da300b003a5c1eacd98mr732542wms.174.1661546973644; 
 Fri, 26 Aug 2022 13:49:33 -0700 (PDT)
Received: from [192.168.8.101] (tmo-083-97.customers.d1-online.com.
 [80.187.83.97]) by smtp.gmail.com with ESMTPSA id
 j15-20020a5d464f000000b0022526db2363sm643563wrs.30.2022.08.26.13.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:49:33 -0700 (PDT)
Message-ID: <c4f5ae98-9ca6-335e-7acf-d8de4137a320@redhat.com>
Date: Fri, 26 Aug 2022 22:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 16/25] tests/docker: flatten debian-riscv64-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-17-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Flatten into a single dockerfile. We really don't need the rest of the
> stuff from the QEMU base image just to compile test images.

You know that the debian11 base image is also just the bare minimum (in 
contrast to the debian10 image that added quite a bit of stuff)? ... so you 
might want to tweak the commit message here a bit, I think.

  Thomas


