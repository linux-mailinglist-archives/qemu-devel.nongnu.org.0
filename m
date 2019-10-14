Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0812D685E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 19:23:22 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK441-0002tm-6N
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 13:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iK3br-0000vo-DF
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iK3bq-0003UW-8x
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:54:15 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iK3bq-0003UM-3L
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 12:54:14 -0400
Received: by mail-pl1-x642.google.com with SMTP id t10so8261413plr.8
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cWvCsuEXPRe/XqYBNYse8Moq05+FCLp6VFgUIuUl1oA=;
 b=PIU9OaO/T8Co7D/aQL+vKOhEUSh+L8h+q41lfhPr+EYiySLg7A8/OzgAWf/VKpGA6g
 eU2jbyqY4ZyFFdLGYLTomYmWe1lVwoqsJBGj+tC9s941ZLANCUIq6jRZlrathHl43kIt
 71KFx8D5t8tVMWRGjB7vLxiC1Ex1vqDIIWwbSe6x3N2DDcEeEKUYv2W6gYSElZIV9mAB
 U8xCAl7Aqzrl9waOWrvEUfmMtKgHQXvfA6ETI4B4eYpGp7GjOpQ7HJCPFGGAddHTGHbv
 tvWyT5gdrMgRYDAff/S1BneIJ8ZvDCJjJh3XUvCS+xiMgSniQlnqe9IlUCUn41z07oa8
 kiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cWvCsuEXPRe/XqYBNYse8Moq05+FCLp6VFgUIuUl1oA=;
 b=sR66VAE5zKVxu0U2Ow7eHgNncH4ByXnrYAcr4TyXn+5nFphrZH3vckKo00ofRxmINj
 Fkg8IOKVvsQRhJnB1JMJgemB69bJIwMydvtJ4/RiK5s7M9jchS9GDLfV7p0jk5ensDfM
 UxU5qORGCTXhfoAGXiDcSILHG/3y3OKCkJwa2d2Mg8YiwYenO51xqlsW5J2077xtQu0H
 CP4TwN+kB2KekJnqvo+rwWeFgrEi8fXKmkAUjCEwO7LcKfi9YB9ASmI78zXO0ysew5dZ
 IKWJRw048Qw9zT1S+r1nRWG9sFqvS+O1GTUBWq2Y3vjbjH+pZozdMqbRm53L5SSLYmH6
 AYIg==
X-Gm-Message-State: APjAAAUGVC4kPP0wa0KWJM7vU0CgYqTnNAHDmihT2+rnB/YXexw1BpxA
 1agVTgTRNzi0sOrHzMmlZ/SfGQ==
X-Google-Smtp-Source: APXvYqy82IamEUG9euawi9v1sIVH36wPiabfCeeCTJnRV/oiRmGcfusWcKWsmhfiycsmITOUKKO6mg==
X-Received: by 2002:a17:902:bc4c:: with SMTP id
 t12mr29751782plz.53.1571072053163; 
 Mon, 14 Oct 2019 09:54:13 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id x11sm714043pja.3.2019.10.14.09.54.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Oct 2019 09:54:12 -0700 (PDT)
Subject: Re: [PATCH v5 51/55] plugins: expand the plugin_init function to
 include an info block
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20191014104948.4291-1-alex.bennee@linaro.org>
 <20191014104948.4291-52-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5230af43-d464-65c4-307e-d41769754546@linaro.org>
Date: Mon, 14 Oct 2019 09:54:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014104948.4291-52-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: aaron@os.amperecomputing.com, cota@braap.org, robert.foley@futurewei.com,
 peter.puhov@futurewei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/19 3:49 AM, Alex Bennée wrote:
> This provides a limited amount of info to plugins about the guest
> system that will allow them to make some additional decisions on
> setup.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/qemu/qemu-plugin.h | 26 ++++++++++++++++++++++++--
>  plugins/loader.c           | 22 ++++++++++++++++++----
>  tests/plugin/bb.c          |  5 +++--
>  tests/plugin/empty.c       |  5 +++--
>  tests/plugin/hotblocks.c   |  5 +++--
>  tests/plugin/hotpages.c    |  5 +++--
>  tests/plugin/howvec.c      |  5 +++--
>  tests/plugin/insn.c        |  5 +++--
>  tests/plugin/mem.c         |  5 +++--
>  9 files changed, 63 insertions(+), 20 deletions(-)

This probably ought to have been sorted before the patches that add the test
plugins, but whatever.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


