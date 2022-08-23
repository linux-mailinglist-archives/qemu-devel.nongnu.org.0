Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3B59DAE5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 13:27:16 +0200 (CEST)
Received: from localhost ([::1]:53080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQS3u-0005w5-OE
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 07:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQS1D-0003Xk-WC
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 07:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQS19-0008Ih-SA
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 07:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661253863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7fVkRcVO+6ojv6BT3Wrp7kEjscmxNtzv9sJKYbpZ2M=;
 b=Rojy7UNH5K2AC3w/xHNYkgj/U1Mc9arUB/pflJPNrXRWTK4ZVLhVSc9p2T49FZs0Fomofn
 uKaYrOZUYcQFVdEihX2CgnEZ9q0Fg9cU5VwUqYrW0Lcy/jGDY3ygKU+x5EtyyfDqlTRdat
 7DsbV5cuRsJ6Ykvlmf2DortkxMz7S+k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408--5fp2zUjNjGzJvaE9zzeWA-1; Tue, 23 Aug 2022 07:24:19 -0400
X-MC-Unique: -5fp2zUjNjGzJvaE9zzeWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so7814523wma.5
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 04:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=t7fVkRcVO+6ojv6BT3Wrp7kEjscmxNtzv9sJKYbpZ2M=;
 b=X5iEHF5m0fbRQQBnJffaW8dvtqIOqcmnavE2u4R793FzkurHE/VbiERlK15WlWggkS
 2ZZad69uumVYeiC2udxGaP9vkrC4g/VnZV8F0N0b4I+RdVT8rbLykWGVKb58/+0z3u29
 CxExPkby3ssgDBiyFFJpGT2ctk9C++iLowxunZsQu5SjjYCdF9iW2qCe7ro8vHNIe45k
 0pbZXGuwc7Alx2yQK9sclt9/JmiOd624dPOqe3VWHmcCfNZHdxvz+17zltjlyK6YICCL
 ztLWgXBojqMRYzzEHIX0z3/9rbFSDSC2UTrigHOLGxDdpdAEplSnwTfbIN+XVtkQ9LwE
 3GQA==
X-Gm-Message-State: ACgBeo2bxzorNj4bmzLu6spbPfpzLrA7ujZ9Zk+tNAcb7WZvsXjIqn4N
 y3f4CwS6YZ4fGrcnIqvsfWNfqTe0ivkkNJSXrVHLfPEY3mblrJEFbW4qxE0jG2VUjjYEfZb/8Wx
 L/6nwPdEYJ+OObQo=
X-Received: by 2002:a05:600c:1e88:b0:3a6:2ca2:e34f with SMTP id
 be8-20020a05600c1e8800b003a62ca2e34fmr1898468wmb.146.1661253858382; 
 Tue, 23 Aug 2022 04:24:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR55Wv1UpM2xtkmhbWdFegYsSSikUOLUpRCYuFP4hlf5ubPDHw7BUthLbdsz+qBw97N9+JjnpA==
X-Received: by 2002:a05:600c:1e88:b0:3a6:2ca2:e34f with SMTP id
 be8-20020a05600c1e8800b003a62ca2e34fmr1898440wmb.146.1661253858061; 
 Tue, 23 Aug 2022 04:24:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-217.web.vodafone.de.
 [109.43.178.217]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c2ca300b003a5ea1cc63csm21469277wmc.39.2022.08.23.04.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 04:24:17 -0700 (PDT)
Message-ID: <03cd9c13-04aa-b541-c5fe-c76181c13530@redhat.com>
Date: Tue, 23 Aug 2022 13:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
Content-Language: en-US
To: luoyonggang@gmail.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220728200422.1502-1-luoyonggang@gmail.com>
 <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
 <CAE2XoE8M+Tz3t=zh5GhX+vYCipNRdZUYieSjtAO2OUsJcYnAPw@mail.gmail.com>
 <2ac21034-c728-04ad-cb33-07870c1f0cc3@redhat.com>
 <YwNUMLxx2HqWUCXs@redhat.com>
 <CAE2XoE9ALbmwDt9=25HewGBBNN0Z=4sJV+4BMkcowCFuWfXkGQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAE2XoE9ALbmwDt9=25HewGBBNN0Z=4sJV+4BMkcowCFuWfXkGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 22/08/2022 16.39, 罗勇刚(Yonggang Luo) wrote:
> After digging, it seems to be a memory issue, cirrus also uses 8gb, that's 
> rather weird...

If it's a memory issue, it might help to remove the "-j2" from the 
invocation of "make", so that only one file is compiled at once...?

  Thomas



