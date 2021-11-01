Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFC4419E7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:30:16 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUZz-0000Qv-Mz
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhUXs-0007SH-F7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:28:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhUXr-0002Ys-0W
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:28:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id m22so27535235wrb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:from:subject:content-transfer-encoding;
 bh=iWFa2E/Qd1gwEzbPnxdyPtM2QZdxXdXh4Z2wx1MeUpE=;
 b=MSldq2WxKHw7G/uUugdp3PUXOnA41BFVL9VqHV52KbtK1E6RwW2Keb2egUycPhUxGb
 1gT2LJnecPqDcW+ELWzQoxKJuntAqYrLyDhbikbFxv9O4n7N/xf2zLn/BfUqculAvdbY
 UfJiQr62g9RK+x/Zmau+DcqOLgo/zj9bjwZcdlRB/2Sxwwyc7Qf49wC8YPeBPn6SUQeO
 zRykqSwU750btbUiepgATVBRqOu/0M7WNl9gzria13eF7ZVwWVPlBPg+cCvI2r3LVBfF
 6rTyANmnF0CqPluk4ELQJKPa44k9DPkB+fLbHESV34Fx6hEI4ClpmB0MEludbNHnNMY1
 xjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=iWFa2E/Qd1gwEzbPnxdyPtM2QZdxXdXh4Z2wx1MeUpE=;
 b=6TpNIvuFfrhZQHaDoEcubInu47fdEneiXULHfzuvp//DR8Y6ZkqXR3gTK2GRwz8oHi
 eXEoxkZzomIbQaBfv7HqgkHw4U8kXs+/5YG8OtCIgUhuV12MqDEYPwZQ/6YO79TwNzrd
 QKzVHlrqrvbh7woO+DbLJI9xHMCR8q7LZNjOAt+e5C1kzfYwMVoG9NeIatHMaSqelkJK
 BRwq/oTFbtRBEegvPUaQTLyMX5qpb7G1pD+U7ZoELg64T7iJRFXLVva81Frhk2lwWTHC
 vcrgX/bUj6Uv4XkjShtI/HRrvw9ZreeTpgBWOdAY8AZ+617keGBCTV5IUyWSnAADnvYp
 yNkA==
X-Gm-Message-State: AOAM532c3AFDxmYEqiVIZ2wKAj9sCf7mq9lBNtPq0n8tVH+WWMZqdD8M
 CInVg66HqLz9tfEg91tmYK8aPrcAJ1g=
X-Google-Smtp-Source: ABdhPJycVSSC0Kvbt2Aokhpob5hc/nwUcxEAOyZh5ASlrp9SFUKunRmqshBZ2Bl76XttQtZRA7MGxw==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr38616545wrr.386.1635762478112; 
 Mon, 01 Nov 2021 03:27:58 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c79sm6467934wme.43.2021.11.01.03.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:27:57 -0700 (PDT)
Message-ID: <e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org>
Date: Mon, 1 Nov 2021 11:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: gitlab-ci: clang-user job failed with run-tcg-tests-sh4-linux-user
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build failed running the 'clang-user' job:

  TEST    linux-test on sh4
../linux-user/syscall.c:10373:34: runtime error: member access within
misaligned address 0x00000048af34 for type 'struct linux_dirent64',
which requires 8 byte alignment
0x00000048af34: note: pointer points here
  00 00 00 00 00 40 0c 00  00 00 00 00 7b e2 f5 de  fc d8 a1 3a 20 00 0a
66  69 6c 65 33 00 00 00 00
              ^
make[2]: *** [../Makefile.target:158: run-linux-test] Error 1
make[1]: *** [/builds/philmd/qemu/tests/tcg/Makefile.qemu:102:
run-guest-tests] Error 2
make: *** [/builds/philmd/qemu/tests/Makefile.include:63:
run-tcg-tests-sh4-linux-user] Error 2

https://gitlab.com/philmd/qemu/-/jobs/1733066358

