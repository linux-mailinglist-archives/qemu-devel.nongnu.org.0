Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D43C3F7D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:21:20 +0200 (CEST)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gt5-0000d8-UH
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2grR-0006zD-Dd
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:19:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2grO-00057A-HL
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:19:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id v5so22138529wrt.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dXiUpv9n2Fna8GIiuEmUgUSfsFLa72u4J3g09Ro27M0=;
 b=JJAGoAxETu9TwZctWS/nImFoTeZud0WfW9mwQ8D5j1sLDO289bOeDhZ6UKRDzOkbSb
 wwA0N9FG8dXYIwjxD3O0JCjPfxg1h3IA6qY+Ish7WSQqYb2VnqXWnFL0W5iWFd56VafD
 mOHabLYdkuEgmNU27IBdRhNUngnTa1HxBio2CGgFB2/damNvjUNTuSDOQX1DDYtxsKAc
 nCAF7caqheRF2YcXptIu2OEefKtMGS/GLn3RfkxxCpvKyjCWeZaHa9JBBNrWn9H6dTwF
 VHWoVcwdC+H2mNpwDF6Th9k/bX1UrBV3mGtghpvBBZAUsDho+tMbl+5NMEmged/Jaj2z
 qLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dXiUpv9n2Fna8GIiuEmUgUSfsFLa72u4J3g09Ro27M0=;
 b=LIEKFQ9k+qNLfp0R31msIQ0qwyC3FQCgqosrD3kctRWn5LvtjEwCHoPXZDYoEE5RZw
 1rPvdfJ3beQ+y417xhfIHCg6yqlIyAbVpQHUL2cPruoOVALaYxlIKN4CT3n1g4Mi3HvJ
 33vZ6IWAPN5lDrLDqdm/lGzgWt7Ho7jPzy64iX+5wlo4bOvLs8z+MQOzbtmyms7Runhn
 YPUaqpSGTE35XEXgJq3y3jWwKB7esBu6NXU8bJs44N+6TAI1dalMSnqfRBrqnz05+nxA
 7iuNHmyje3EEUtLg7Hp8h4/niBQvkx4tbzB1YH5kTeFTOhkdtpg/zjf9fajO7+r2Pz0e
 kgoQ==
X-Gm-Message-State: AOAM533KQ8Ah9IDm1ElsQfZOPFyecDJrnhw3oHJ8oh0zntlBAGCgdKYC
 TIAbJcuyBvH7F8Pas/0VQ0zYEWRKmEzHM1nZ
X-Google-Smtp-Source: ABdhPJzZAalWUkLli6Y+ZanQjVr2ctq02UGWGVbTrcSvdGgyT8lU30+/pv+vxqoqSvB7evMkiNSBFg==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr21676519wrx.298.1626038372611; 
 Sun, 11 Jul 2021 14:19:32 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id q5sm10679742wmc.0.2021.07.11.14.19.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 14:19:32 -0700 (PDT)
Subject: Re: [PULL 00/19] MIPS patches for 2021-07-11
To: qemu-devel@nongnu.org
References: <20210711210016.2710100-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <524c3759-da29-b98a-7b0d-c37f0822f006@amsat.org>
Date: Sun, 11 Jul 2021 23:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 10:59 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 9516034d05a8c71ef157a59f525e4c4f7ed79827:
> 
>   Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-6.1-2' into staging (2021-07-11 14:32:49 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/philmd/qemu.git tags/mips-next-20210711

Resending with correct tag.

