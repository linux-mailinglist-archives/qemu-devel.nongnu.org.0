Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F856BE88
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 19:58:02 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9sEq-0002It-NK
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 13:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9sAn-0008P7-FY
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 13:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9sAM-0000Yh-NB
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 13:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657302801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMXIjvX+UCigV7EShc6BTHKFakS6DwNWPmdABTNbw2A=;
 b=XSWa5xvRYUgqDU+kkuK71dQ8Q+C92Y44RJ9JnRblDLPzcFrNnNUbWw4NSUD4TfOKEoSAB0
 fg6Izm/3ghgEY1Cu7mmZ9N1lbYAtsM/ZMwasQZ5b//g4Hf/L1PVuBhGjvR4/5ig6dRf1XC
 hemsGGlSU1XmrGDct3zCvklMK5c1CLs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-8QCU3pZjPlyqS7ZuoqFAdg-1; Fri, 08 Jul 2022 13:53:20 -0400
X-MC-Unique: 8QCU3pZjPlyqS7ZuoqFAdg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so9736655wmr.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 10:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lMXIjvX+UCigV7EShc6BTHKFakS6DwNWPmdABTNbw2A=;
 b=dnpHmFMXLaBo440rNln1LWBtBbuj1vWV1JBimw+Yh12MoXh5lizF/BEv76jdV/xQjS
 TPWuwMq7DCPWCXw8wn04nQEwMpHq6hV+LSKCxFX/A0Jqo83zYwFbW8aIHW6/foyKe/lP
 2pcsxj0T57FfDdNkn5KvZx0LHbcGywVnAnHbNbXwRNVFO4oKJG/U3fEwWuoEH+PvtjLw
 B+D1D0qbcmkbBUmypmAnRvywXaFUE/Ney6romX0PVo7H7cxm+lzpUoZ7Gaj8oGI72ck0
 HQxZ0AvATgqeZUriPqppv0Oj06zTR9puU8f7GnI4rWoDy5MrIWhTU7Y6dpgI8HSCaIlG
 EyKw==
X-Gm-Message-State: AJIora/c3GP20Zg8exvr/W4Wnj/YG7Mw2qR2hoeHcffxa8vLHok3BrFU
 HqmLLYxgB9ryTYEDfL0JBlnnoBjRDMVLtpHL2K/40FhShRQmaTuGe5sC1ILVXS5jOqfcuhxoHsA
 JyTDXrPGQUScV+Yo=
X-Received: by 2002:adf:f78d:0:b0:21d:6e79:88a2 with SMTP id
 q13-20020adff78d000000b0021d6e7988a2mr4453583wrp.493.1657302799040; 
 Fri, 08 Jul 2022 10:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vxK2nN9Q/rFgVNdr8GtXaWjGuHd8EYnGA14eXwPifZ6jgW19+eDffAkeL/lcc3ZVFIFFD4lw==
X-Received: by 2002:adf:f78d:0:b0:21d:6e79:88a2 with SMTP id
 q13-20020adff78d000000b0021d6e7988a2mr4453569wrp.493.1657302798787; 
 Fri, 08 Jul 2022 10:53:18 -0700 (PDT)
Received: from [192.168.8.100] (tmo-099-20.customers.d1-online.com.
 [80.187.99.20]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c4ecc00b0039c99f61e5bsm3294320wmq.5.2022.07.08.10.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 10:53:18 -0700 (PDT)
Message-ID: <9014432a-045f-a1ee-add6-7a37c693ee2f@redhat.com>
Date: Fri, 8 Jul 2022 19:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Intermittent meson failures on msys2
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <c27c93e9-c6e9-1d12-8b45-41c34065a977@linaro.org>
 <CAJ+F1CLQ6Y-tzcjwQeL=EO21+v+_49F85E2fnEcN170Gb89kjw@mail.gmail.com>
 <YsgtZo/dQPT58Sfm@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YsgtZo/dQPT58Sfm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 08/07/2022 15.13, Daniel P. Berrangé wrote:
> On Fri, Jul 08, 2022 at 04:41:48PM +0400, Marc-André Lureau wrote:
>> Hi
>>
>> On Mon, Jun 27, 2022 at 6:41 AM Richard Henderson <
>> richard.henderson@linaro.org> wrote:
>>
>>> Hi guys,
>>>
>>> There's an occasional failure on msys2, where meson fails to capture the
>>> output of a build
>>> script.  E.g.
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/2642051161
>>>
>>> FAILED: ui/input-keymap-qcode-to-linux.c.inc
>>> "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe"
>>> "C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal"
>>> "exe" "--capture"
>>> "ui/input-keymap-qcode-to-linux.c.inc" "--"
>>> "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe"
>>> "../ui/keycodemapdb/tools/keymap-gen" "code-map" "--lang" "glib2"
>>> "--varname"
>>> "qemu_input_map_qcode_to_linux" "../ui/keycodemapdb/data/keymaps.csv"
>>> "qcode" "linux"
>>> [301/1665] Generating input-keymap-qcode-to-qnum.c.inc with a custom
>>> command (wrapped by
>>> meson to capture output)
>>> ninja: build stopped: subcommand failed.
>>>
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/2625836697
>>>
>>> FAILED: ui/shader/texture-blit-frag.h
>>> "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe"
>>> "C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal"
>>> "exe" "--capture"
>>> "ui/shader/texture-blit-frag.h" "--" "perl"
>>> "C:/GitLab-Runner/builds/qemu-project/qemu/scripts/shaderinclude.pl"
>>> "../ui/shader/texture-blit.frag"
>>> [313/1663] Generating texture-blit-vert.h with a custom command (wrapped
>>> by meson to
>>> capture output)
>>> ninja: build stopped: subcommand failed.
>>>
>>>
>>> Could you have a look please?
>>>
>>>
>>>
>> Ah, we don't have artifacts for msys2 builds it seems, that would perhaps
>> help. It would make sense to at least take meson-logs/*.txt. I'll work on a
>> patch.
>>
>> My guess is that CI randomly fails with "too many opened files", as I have
>> seen that regularly on various projects with Windows runners. And here,
>> it's probably reaching limits when running python/perl scripts
>> simultaneously... I don't see an easy way to solve that if that's the issue.
> 
> There shouldn't be very much parallelism even taking place, because
> 
> https://docs.gitlab.com/ee/ci/runners/saas/windows_saas_runner.html
> 
> says  "Windows runners execute your CI/CD jobs on n1-standard-2
>         instances with 2 vCPUs and 7.5 GB RAM. "
> 
> unless ninja is setting a parellism much higher than nCPUs ?

We're compiling with "make -j2" there, see .gitlab-ci.d/windows.yml ... so I 
don't think that it's about too many things going on in parallel. 
Additionally, the problem hasn't been there a couple of weeks ago, so it's 
either something new that we merged recently, or the Windows containers or 
MSYS2 environment has been changed recently?

  Thomas


