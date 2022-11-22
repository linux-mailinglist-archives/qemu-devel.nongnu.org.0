Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA80633FDF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUvC-0001rB-Ua; Tue, 22 Nov 2022 10:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUvA-0001qd-14
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:10:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxUv7-0006wz-7n
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:10:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v1so25127738wrt.11
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ThKu+t6irTv73m8p7aEWsbq4mHIbv6ADWuq0AoAEUfY=;
 b=Y2zgZjUo5IIXlAStEty/liujTidtzswAGZ5IqiU+U7/E+D3agEj/UwiUFi0/rca0ZM
 m7lDi7hqbhEWBoqw3HoWAZgWH8+rUyY0RQ3GS3emoZibCAjIbZyCQw/mBX9RYzFk6HBV
 K2uQLSrhyFDlznt906bny1WDB5sHuavB8nd7rElcptClls4iGkqKl7bVst2Fo0V3VI7g
 dnRtFJQHtuxsOmToh9Bsd2uMIE0x4DjVBB/kR4a2eOSOrPmxIJjouAO/EEqy2jY8dxFe
 4ppS15OSmyWBQ5xQaDR+ZicvwdojBRLCABjZh9fmcb7xsnUCqHX6m0xpeHt7YqcmueTF
 tgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ThKu+t6irTv73m8p7aEWsbq4mHIbv6ADWuq0AoAEUfY=;
 b=oK0OSc0YeyVpw7KIhaBHeo5p3/gzRJCYI8ls8zDo8XfuX3my1WmJoZKXpqgLTkbOBg
 YX11wF25oAREQUvwPsO03/9IJuG9qnZ/gRkclyWPbj3yRPzCc94w5I/kRbycpwYJ7LHE
 +QXqeDI6sDD/p3Y7iTQed61lqSGY39TsVopdzpJBdZg6VgN6x/kax13iNLP5qnPyw0gm
 2zXxmKayAO4YdkIUUA5SSowR+4lMBp9ZPNgNTnnW/fbDD5jtKDIK0MlhOf9ViN9gZqur
 K6K3LzogiIQisvfsDg/3ZH8nXZhlZTf0AqG5lX2XlnpNZfAmmUtbs0oocpi37pccnr2C
 gFuQ==
X-Gm-Message-State: ANoB5pngtfeP6XTxfSlHYbdIYeb1xlZsx4j1ia05mktH96iJXOrL8dz+
 TnTwY6mQMTLubvHDZvv1m53LHA==
X-Google-Smtp-Source: AA0mqf43hhBtMfXVQ4Kl73yd09/VNnF1wZ4i0AlLAwadGypoKclTGeQUk+BVwFLZVhHO64nKkV4oyA==
X-Received: by 2002:a5d:6a08:0:b0:241:da26:bddf with SMTP id
 m8-20020a5d6a08000000b00241da26bddfmr5446844wru.591.1669129843673; 
 Tue, 22 Nov 2022 07:10:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b4c979e6bcsm24941777wms.10.2022.11.22.07.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:10:42 -0800 (PST)
Message-ID: <58463615-23ab-5f08-de12-ccc5587040d6@linaro.org>
Date: Tue, 22 Nov 2022 16:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] cleanup: Tweak and re-run return_directly.cocci
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn,
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, berrange@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, suhang16@mails.ucas.ac.cn, chen.zhang@intel.com,
 lizhijian@fujitsu.com, stefanha@redhat.com, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, virtio-fs@redhat.com
References: <20221122134917.1217307-1-armbru@redhat.com>
 <20221122134917.1217307-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221122134917.1217307-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/11/22 14:49, Markus Armbruster wrote:
> Tweak the semantic patch to drop redundant parenthesis around the
> return expression.
> 
> Coccinelle drops a comment in hw/rdma/vmw/pvrdma_cmd.c; restored
> manually.
> 
> Coccinelle messes up vmdk_co_create(), not sure why.  Change dropped,
> will be done manually in the next commit.
> 
> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
> manually.
> 
> Whitespace in tools/virtiofsd/fuse_lowlevel.c tidied up manually.
> 
> checkpatch.pl complains "return of an errno should typically be -ve"
> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
> it visible to checkpatch.pl.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/coccinelle/return_directly.cocci |  5 +--
>   include/hw/pci/pci.h                     |  7 +--
>   target/avr/cpu.h                         |  4 +-
>   hw/9pfs/9p-synth.c                       | 14 ++----
>   hw/char/sifive_uart.c                    |  4 +-
>   hw/ppc/ppc4xx_sdram.c                    |  5 +--
>   hw/rdma/vmw/pvrdma_cmd.c                 | 57 +++++++++---------------
>   hw/virtio/vhost-user.c                   |  6 +--
>   migration/dirtyrate.c                    | 10 +----
>   migration/tls.c                          |  6 +--
>   replay/replay-time.c                     |  5 +--
>   semihosting/console.c                    |  4 +-
>   softmmu/memory.c                         | 11 +----
>   softmmu/physmem.c                        |  9 +---
>   target/loongarch/cpu.c                   |  4 +-
>   target/mips/tcg/dsp_helper.c             | 15 ++-----
>   target/riscv/debug.c                     |  6 +--
>   target/riscv/vector_helper.c             | 28 +++---------
>   tests/bench/benchmark-crypto-akcipher.c  |  6 +--
>   tests/qtest/erst-test.c                  |  5 +--
>   tests/qtest/hexloader-test.c             |  6 +--
>   tests/qtest/pvpanic-pci-test.c           |  6 +--
>   tests/qtest/pvpanic-test.c               |  6 +--
>   tests/qtest/test-filter-mirror.c         |  6 +--
>   tests/qtest/virtio-ccw-test.c            |  6 +--
>   tests/tcg/multiarch/sha512.c             |  9 +---
>   tools/virtiofsd/fuse_lowlevel.c          | 24 +++-------
>   27 files changed, 70 insertions(+), 204 deletions(-)
> 
> diff --git a/scripts/coccinelle/return_directly.cocci b/scripts/coccinelle/return_directly.cocci
> index 4cf50e75ea..6cb1b3c99a 100644
> --- a/scripts/coccinelle/return_directly.cocci
> +++ b/scripts/coccinelle/return_directly.cocci
> @@ -11,9 +11,8 @@ identifier F;
>   -    T VAR;
>        ... when != VAR
>   
> --    VAR =
> -+    return
> -     E;
> +-    VAR = (E);
>   -    return VAR;
> ++    return E;
>        ... when != VAR
>    }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


