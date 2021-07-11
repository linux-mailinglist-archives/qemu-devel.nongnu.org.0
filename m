Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE883C3F2C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:28:33 +0200 (CEST)
Received: from localhost ([::1]:57308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2g3z-0004KW-Sw
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2g2u-00038j-K5
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:27:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2g2t-0002Yx-0k
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:27:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id t5so8112126wrw.12
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 13:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AsfL27cud90PcT5po5a82g1ZK+prUVUWfcwMX1626+Q=;
 b=bi4v1Lt4J3TEbYMJf9Dl8ogZB9Ta0QZCD0pzku+uXZsUmyrIaPikeIFT76IZSlzO59
 kcAgkZyxS9cDeKs5v9il6ddxTk1j4qiBoBfNI0lkQloD7AUtBhx+pVxcvdjLn+gFkS/k
 W65bb3IJiBdJMJOzzColVj+LDU1yjK4cUQ+y4+ku/CNaNfc88Ht/IgfA165tDnq/DaFj
 gElr+HmcEkKMRmRj0GsXzm+U47UcnGWNWaX/NB+cI8XNqFI2BAJ2aNMfIp0rpTa9ocjq
 VONpckUxyJCT0wq3Sjmb7MavNTnXge985RnN7066nbEcIAqpqOUvMy/Jk+52Q6IOjgKd
 /ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AsfL27cud90PcT5po5a82g1ZK+prUVUWfcwMX1626+Q=;
 b=iFy7mJE0OsL8DcnlfI2TFulZHNNuX8EBQd51dmW8kRwlcK08z/xpkxEBbK2lDVg5Ie
 ILsQUjjwsxabf9X8K3q89mKTD660WDi4K32R8CQalAnHy89UJ8SYG73JluRgP9LquTvf
 qoHlUMKyaEg2DWOO91strM12d7k6rzhxPBfqC1pZS9Q7hgDlcq1W+uCfeZs6ki0G3836
 b0TdmWcXk4+NbVzIZj2MRtpmTfJRXYDF/JnoKSAqXSbGwv0aM3qPljaB+HB4EuJzxGXJ
 iUiU+ZoPheIdMAHLaGxehgymHQfGqdO52y+6NEdCL6JQUxIERZPj0NLBYB+2ftytVIUH
 WMHw==
X-Gm-Message-State: AOAM5336O4T37QYIktbkc4WNezzJn1VMRm1UVVAlFabuOR/+Ih8AIL/x
 ddrBMBB8kzvVJBgPnnPjqIg=
X-Google-Smtp-Source: ABdhPJzD6VnDWo9D99fJW1kYR0SwF4bwj9R8LIZq9dmUWooczIO3W3PqSDARdLNgWgYdYHF4gvNtXw==
X-Received: by 2002:adf:f885:: with SMTP id u5mr13752088wrp.84.1626035240713; 
 Sun, 11 Jul 2021 13:27:20 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f5sm13089536wrg.67.2021.07.11.13.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 13:27:19 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/22] target/mips: Reintroduce the R5900 CPU
 (without testing)
To: qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b3ec8b76-46b4-845a-01df-87a8accc96d5@amsat.org>
Date: Sun, 11 Jul 2021 22:27:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.631,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 3:56 PM, Philippe Mathieu-Daudé wrote:
> First part (TCG, testing postponed) of RFC v1:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782449.html
> 
> 3 patches can still be improved for performance, but the improvement
> is not yet addressed in this series. Other patches are good enough
> for review.
> 
> https://gitlab.com/philmd/qemu/-/commits/mips-r5900-v2
> Based-on: mips-next
> Supersedes: <20210214175912.732946-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (22):
>   target/mips/tx79: Move MFHI1 / MFLO1 opcodes to decodetree
>   target/mips/tx79: Move MTHI1 / MTLO1 opcodes to decodetree
>   target/mips/translate: Make gen_rdhwr() public
>   target/mips/translate: Simplify PCPYH using deposit_i64()
>   target/mips/tx79: Move PCPYH opcode to decodetree
>   target/mips/tx79: Move PCPYLD / PCPYUD opcodes to decodetree
>   target/mips: Remove 'C790 Multimedia Instructions' dead code
>   target/mips/tx79: Salvage instructions description comment
>   target/mips/tx79: Introduce PAND/POR/PXOR/PNOR opcodes (parallel
>     logic)
>   target/mips/tx79: Introduce PSUB* opcodes (Parallel Subtract)
>   target/mips/tx79: Introduce PEXTUW (Parallel Extend Upper from Word)
>   target/mips/tx79: Introduce PEXTL[BHW] opcodes (Parallel Extend Lower)
>   target/mips/tx79: Introduce PCEQ* opcodes (Parallel Compare for Equal)
>   target/mips/tx79: Introduce PCGT* (Parallel Compare for Greater Than)
>   target/mips/tx79: Introduce PPACW opcode (Parallel Pack to Word)
>   target/mips/tx79: Introduce PINTEH (Parallel Interleave Even Halfword)
>   target/mips/tx79: Introduce PEXE[HW] opcodes (Parallel Exchange Even)
>   target/mips/tx79: Introduce PROT3W opcode (Parallel Rotate 3 Words)
>   target/mips/tx79: Introduce LQ opcode (Load Quadword)
>   target/mips/tx79: Introduce SQ opcode (Store Quadword)
>   target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()
>   target/mips: Reintroduce the R5900 CPU

Patches 9-15 & 18 applied to mips-next.

