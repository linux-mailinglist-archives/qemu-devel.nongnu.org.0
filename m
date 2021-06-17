Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B269C3AB797
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:35:52 +0200 (CEST)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltu3b-0004rR-PR
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltu2V-0003Sm-Fx
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltu2R-0006Tw-Ph
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623944078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcAA+zOHDgYxEqtgkaf12g2FFUaF1/2sHfTRCn1+j6U=;
 b=EHTzRa1J36zGhcMqYADsRmyLnY81W3o06QW9flsGCI+Q1XO4PIE7fhABwKQHRZkPZb9RlI
 mzj0vEUlZsRmR6goycfL3+Kl8HyjCfYzj4sTQyiKznmEmQarnJopYZHn4LSL/ESXIteOYp
 TuLPeWlP7gp6Fekz+zpaZblmXJZ/HTY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-dS06DXAfMFurSd2ci-1qdg-1; Thu, 17 Jun 2021 11:34:36 -0400
X-MC-Unique: dS06DXAfMFurSd2ci-1qdg-1
Received: by mail-wr1-f71.google.com with SMTP id
 t10-20020a5d49ca0000b029011a61d5c96bso3088627wrs.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NcAA+zOHDgYxEqtgkaf12g2FFUaF1/2sHfTRCn1+j6U=;
 b=W/RLknAnrVIY6RrG4utvuHqujx743NNcNzBisZGKoVS4v/JBI6awhp+1s0e4c2qTot
 QyJlO7pJTqWPUFoNgN6EkALOpYgDy3XQGqLP6885sFdJzfZU/bUeBtKOg76CTKOhyx0t
 bpGZGIoPvC8DnIGOtUj1vs7Vy4mztu3dS8rCBxTEQt4LldxGYW1hD7w4a56ckjvo40Tg
 YMtEoAnzE8x2wsDrLlu4wyrNq7Vf9YKIg3XkyRryyuqaRGGF4l7+kblGJqja5X2vMw75
 StpvB2DvLQ4Pa3smtIbuYpZjmTnKyxe83kjmbwxFCe0zgxOA7pc2vOo8Dg6smfoyjMd+
 0EdA==
X-Gm-Message-State: AOAM531zQVC/x+kkS9TAjap4LZdT7BEy72nOXI9dEuqGVxTWDeP6BFUz
 R+rGFCa94RzQHZGJEPlkdvzQXYNBYaDak2c3Nv8eSGTcVkd5Xpes8uLDTP6SPZZEWEAjTdCiaXu
 C7+lZ9G2Ab+G/u1A=
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr5982251wmq.4.1623944075316; 
 Thu, 17 Jun 2021 08:34:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxJY+MuwIc5pnlj8OmVjHhwpQMRHrtAVE52wu60Bf2uk7Eo2/9CnSfbfWGO3TT0eVGfIOBBA==
X-Received: by 2002:a05:600c:190f:: with SMTP id
 j15mr5982208wmq.4.1623944074927; 
 Thu, 17 Jun 2021 08:34:34 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d16.dip0.t-ipconnect.de. [217.87.93.22])
 by smtp.gmail.com with ESMTPSA id j12sm5846699wrt.69.2021.06.17.08.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 08:34:34 -0700 (PDT)
Subject: Re: [PULL 00/33] Misc patches for 2021-06-15
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
 <CAFEAcA_LNDqvLS7g7RqPHB54nrphjkuF3w=K2x-wX9D_oJfhKA@mail.gmail.com>
 <7b25ff29-4f7e-aca5-d3b1-7732b35c018c@amsat.org> <87czskg5xg.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2f28b982-2577-573d-7414-abc86bb53bce@redhat.com>
Date: Thu, 17 Jun 2021 17:34:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87czskg5xg.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2021 12.06, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 6/15/21 4:17 PM, Peter Maydell wrote:
>>> On Tue, 15 Jun 2021 at 14:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>
>>>> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:
>>>>
>>>>    Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>>>
>>>> for you to fetch changes up to 429f60abe15cca9046e6aeaffd81e991e34c9bf6:
>>>>
>>>>    configure: map x32 to cpu_family x86_64 for meson (2021-06-14 20:17:55 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> * avoid deprecation warnings for SASL on macOS 10.11 or newer
>>>> * fix -readconfig when config blocks have an id (like [chardev "qmp"])
>>>> * Error* initialization fixes
>>>> * Improvements to ESP emulation (Mark)
>>>> * Allow creating noreserve memory backends (David)
>>>> * Improvements to query-memdev (David)
>>>
>>> Fails to build on all the BSDs and OSX:
>>
>> FWIW I sent a series adding FreeBSD to GitLab:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg809453.html
>>
>> But we might get it even quicker apparently, by plugging our
>> cirrus-ci to gitlab-ci:
>> https://potyarkin.ml/posts/2020/cirrus-ci-integration-for-gitlab-projects/
> 
> I wonder if the mirror between github/gitlab is kept upto date quick
> enough? I guess we need to clone of the real URL to work across peoples
> personal repos.

If we use the cirrus-run tool in our gitlab-CI, we don't need to wait for 
the mirroring to github anymore.

IIRC Daniel was working on some patches (using that lcitool from libvirt), 
which could be used to enable cirrus-run for the QEMU gitlab-CI, too ... 
what's the status here? ... or did I remember that wrong?

  Thomas


