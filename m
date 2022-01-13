Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6648D6E2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:46:04 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yYN-0006dx-9v
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:46:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yUU-0003gV-1N
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:42:03 -0500
Received: from [2a00:1450:4864:20::530] (port=35333
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yUQ-0003AO-3B
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:42:00 -0500
Received: by mail-ed1-x530.google.com with SMTP id q25so22024281edb.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l/XMu0BKneGEZspUfGqn6ExZSu0GqhmbG+IaKmdBsZA=;
 b=FJU6xXIyVEF1bPohl2yDj/bARgEgIMTz8LJzPArXPwSq2lKqIMYgXcN67Txtlk7iLA
 YHJKoRiL3FfBBpshpIDFK5pBpbF+L24wnYhwzqlkqYHw1Qh9sRKHcFKOt6qIxph1BW/h
 KG7Nd4M09hZ/tTKBDCd4iFaiaZ56XfV82sw74HGorff4PkoeiDMvpfc9yDIlDsWFrbBf
 QN19woOlvX8tmVXUgO7idtDcxeF0amcOCzLUfWITMZCh9j3qXWITPvQJjJ0RFl3VqwdH
 JhY8pxuEF9VuGlYKzfRk2qwLI25i4hiQwn368zH+co7yuhCpqpgpQRGonZrzCMEBL3za
 /YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l/XMu0BKneGEZspUfGqn6ExZSu0GqhmbG+IaKmdBsZA=;
 b=cxPgknaIZzrcBFxiPXBwrJusDtWqJH6VY4JaMfyGKfhOQxkFbcSWgiNKlqz0tazKLr
 WFmK4WpXQ2SlqtJ0lctW+DSfJ7CIFzo1+hzlCZX1cCHyBYC6wIjMiPiFPSmOyAAUj45V
 7eQABgWPWTT9NWRp5G+KPIG8WpN/Ee0zLemV0svgIdPWp8H/uwUcMqQ7owYdr9rFPTV2
 9ZDCMXGaGgBbqyvcaI+pcBRAb0wE8rvmtZfL9xiVIMbCC3EGnTMacfN9n8+ogaemBy7d
 X0ALV5MiHs8j2braO3HVadgnJj3qdHZQD8uoxglzvvFGJttShYaolsIrvtE6WHYIIxfZ
 1NnQ==
X-Gm-Message-State: AOAM533j2ynHZ/C30jKl3ecls3ItOtEzPVkd77/r+S8/xTLDtdc9i3It
 14UwwVqzQmE4H2ygmgvSMec=
X-Google-Smtp-Source: ABdhPJyMAHxrCMwU/lKPT5xEmM2mwNQflQxhCfGvs7MMLfPK0nL4zWrQ2HnkP3DH3vjovUThaLntbg==
X-Received: by 2002:a17:906:7217:: with SMTP id
 m23mr3075406ejk.735.1642074101640; 
 Thu, 13 Jan 2022 03:41:41 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id y2sm1062992eda.45.2022.01.13.03.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 03:41:41 -0800 (PST)
Message-ID: <4277f659-7514-5ec5-480a-a349699c6a6a@amsat.org>
Date: Thu, 13 Jan 2022 12:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v3 7/7] gitlab-ci: Support macOS 12 via cirrus-run
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-8-f4bug@amsat.org>
 <c3c894b5-e6a6-d203-83c6-07c15982c281@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c3c894b5-e6a6-d203-83c6-07c15982c281@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/1/22 08:39, Thomas Huth wrote:
> On 10/01/2022 14.10, Philippe Mathieu-Daudé wrote:
>> Add support for macOS 12 build on Cirrus-CI, similarly to commit
>> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").
>>
>> Update the lcitool repository to get the macos12 mappings,
>> and generate the vars file by calling 'make lcitool-refresh'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Pending on libvirt-ci MR #210:
>> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
>> ---
>>   .gitlab-ci.d/cirrus.yml           | 15 +++++++++++++++
>>   .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>>   tests/lcitool/libvirt-ci          |  2 +-
>>   tests/lcitool/refresh             |  1 +
>>   4 files changed, 33 insertions(+), 1 deletion(-)
>>   create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
>>
>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>> index b96b22e2697..b7662959070 100644
>> --- a/.gitlab-ci.d/cirrus.yml
>> +++ b/.gitlab-ci.d/cirrus.yml
>> @@ -87,6 +87,21 @@ x64-macos-11-base-build:
>>       PKG_CONFIG_PATH: 
>> /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig 
>>
>>       TEST_TARGETS: check-unit check-block check-qapi-schema 
>> check-softfloat check-qtest-x86_64
>> +x64-macos-12-base-build:
>> +  extends: .cirrus_build_job
>> +  variables:
>> +    NAME: macos-12
>> +    CIRRUS_VM_INSTANCE_TYPE: osx_instance
>> +    CIRRUS_VM_IMAGE_SELECTOR: image
>> +    CIRRUS_VM_IMAGE_NAME: monterey-base
>> +    CIRRUS_VM_CPUS: 12
>> +    CIRRUS_VM_RAM: 24G
>> +    UPDATE_COMMAND: brew update
>> +    INSTALL_COMMAND: brew install
>> +    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
>> +    PKG_CONFIG_PATH: 
>> /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig 
>>
>> +    TEST_TARGETS: check-unit check-block check-qapi-schema 
>> check-softfloat check-qtest-x86_64
> 
> Since we cannot run that many Cirrus-CI jobs in parallel, I think it 
> might make sense to limit the macos-11 job to manual mode now?

TBH I don't know, IIUC macOS seems somehow a bit tied with hardware
(updated less often), and apparently our user base is still interested
in having the previous Catalina version working too.

What about FreeBSD jobs? Do you also plan to set the FreeBSD 12 job to 
manual?

Maybe we could split the configured options, but I'm not sure we'll save
much, the basics to be covered are major sysemu with ui, tools & doc.

