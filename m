Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085048C732
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:27:37 +0100 (CET)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fXD-0002yt-Mn
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7eun-0000Mq-FF
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:47:53 -0500
Received: from [2a00:1450:4864:20::434] (port=40920
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7eul-0003Zf-Ii
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:47:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id x4so4664336wru.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 06:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=E3Ml5bOna3KwUWF/evJyNay43nzmH06zATFRpeLoC0E=;
 b=pebLfOh90ItY9T/wxI7vYvnx0LDC9XY4AfslB+DR5tRgNL9RP3sPXB0f8AgqLAXVwE
 uBweynov7lJEAs+wJQ0phKdK2p437Pqk8YdZwRMENUVHMK6ykKE+zcqw65U7Akyz9rEf
 CbxyTRHDL4cq8EdJ4NtvQ3JE3ddBRohogTqZMI9vZYJ+Q6M/D5LJBUQrTTNls+veJb1K
 xRlsdSLIaoz4sod4QVvkTot/GHsafjuaj8KToCXoZS3qTM2EaIvIrDlCjOcKlbxhOXYl
 27Hsk4dVTQLpBU383H9pD6oKC081qz8l4NsUWI68wFhH3x7GzKCYEvLSlCOjeW+j4JhW
 F7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=E3Ml5bOna3KwUWF/evJyNay43nzmH06zATFRpeLoC0E=;
 b=3+6VlbZA3oZ/wo5kjzRCkzxSn9Xq+CjaiHnfV32W+f+g9uErDrNdM4gYD3jSkgvZ2P
 h5vOwWNAkphbuQAbMQTzey6oriDtp++tL/hEqFSVYAuw5SRHbHXyLIJegeX2zVCigwIO
 dGBNBA7w3bQeJYjjjjcQvEPLoCd+50dmJNEb5W7c5N9ES0ft3lvGnZOnU5Oxs/hzeYmG
 jytnA59JtS+s78jpQ+DddE3LrTvkvv7hgh80xQMRyqOQhXh5F7BZ7FVsL7gOCzf4MFt1
 mvjZUqQuxmi/4MGPevyKArAIkHD6I8k57Nf/j81qclXZZHItkok7x0i1g/Zkp/eebe3I
 T9XQ==
X-Gm-Message-State: AOAM5323IJBrdlKNuHw4xwz9SvD8cCOzQ4YU3aUaVly0SZ2tKB8P+u4A
 0/orQE4kHJ2V175yebW5mZ8=
X-Google-Smtp-Source: ABdhPJz7x3PeFJpdQ9QvlB2qeAlLNOlT+u8nCpUruwfJkfHbxPzLf2cmhMdZa4PsF+oDFp21mGKrZg==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr43768wrr.699.1641998865509;
 Wed, 12 Jan 2022 06:47:45 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id h14sm76314wrz.31.2022.01.12.06.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 06:47:45 -0800 (PST)
Message-ID: <e519539c-69f3-947d-9b04-61d642e15632@amsat.org>
Date: Wed, 12 Jan 2022 15:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 1/7] configure: Allow passing extra Objective C
 compiler flags
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Roman Bolshakov <roman@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-2-f4bug@amsat.org> <Yd27fVx1iHyvA9ng@roolebo.dev>
 <7da4d428-9b9e-e4ee-39af-48a8223df8e6@amsat.org>
 <4492570c-1dd0-cf08-abf3-eabcae706039@amsat.org>
In-Reply-To: <4492570c-1dd0-cf08-abf3-eabcae706039@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Emilio G. Cota" <cota@braap.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 15:09, Philippe Mathieu-Daudé wrote:
> +Emilio
> 
> On 1/12/22 14:46, Philippe Mathieu-Daudé wrote:
>> Anyway, with your/Akihiko/Christian help during review, this flag
>> is not necessary anymore to build softmmu/tools (I still have to
>> figure how to silent the "#pragma FENV_ACCESS" warning in tests),
>> so let forget about this patch (except if we expect macOS ObjC to
>> keep evolving and need a way to pass OBJCFLAGS).
> 
> Apparently Clang equivalent of "#pragma STDC FENV_ACESS ON" is
> "-ffp-model=strict"
> 
> https://clang.llvm.org/docs/UsersManual.html#cmdoption-ffp-model
> 
> I'll see if patching tests/fp/meson.build is sufficient.

This seems to do the job:

-- >8 --
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a79..b790487648a 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -37,6 +37,12 @@
   '-Wno-error',
 ]

+if cc.get_id() == 'clang' and cc.has_argument('-ffp-model=strict')
+  # Clang does not support '#pragma STDC FENV_ACCESS', but starting
+  # with Clang 10.0 the equivalent is -ffp-model=strict.
+  tfcflags += [ '-ffp-model=strict' ]
+endif
+
 tfgencases = [
   tfdir / 'genCases_ui32.c',
   tfdir / 'genCases_ui64.c',
---

