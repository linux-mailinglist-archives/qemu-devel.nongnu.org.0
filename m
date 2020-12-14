Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87D2D9E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:13:35 +0100 (CET)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosLm-00039E-D9
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kosKA-0002Cf-Sq
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:11:56 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kosK7-0002me-Fi
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:11:54 -0500
Received: by mail-pl1-x641.google.com with SMTP id t6so9095405plq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zZQOpBUXHM5FhG12DN1mo26fW4KTBP7fEaYYY00dYUA=;
 b=jCOUlsgSh+cMPGVcQnlkP3/xUSuV9G6UaZ+EIpbpU5LH+gugDZhWUaohn7Nv1eEyTO
 cT7sg5BrD6g6/lv+ul+qNgncUwv/q8UzW7Bxuw2ZQwDTJJosurz9kSVXh7OnIPG1yfT6
 qkGndHE1Qq37LYdlvurgw/NcROsdMR763DWersll/qfM4JxAA94xA/dK3uK1sV+K32hu
 A03vbTXXY/9QvxZcHmv5Unk7ctGPelb0MUmWCLqyIaaeJ4dGZnRlf8yRAaDapSaEE7ip
 iqpY8oS4GlPEF4JKmUfEJEoKwcaRFS+Yf8z3ZUIvbWKBpm8I7EzJnSfJoOAtCkBT2oPc
 hcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zZQOpBUXHM5FhG12DN1mo26fW4KTBP7fEaYYY00dYUA=;
 b=dv//rgE9HlTCYoz0Ci3eGloMBwYRwQHUuX45HjfYEUefdzkkdNf5xJeghN7woQ2WS7
 HR0ry7oFmeNlgVDjkNoMip7PmfAz4/fhJ90nHDiMtKJLW4JcQlfCwoyqd1LAR2AFBiRA
 lrS1F4vU0vmr5QMaWLrzlEKmj27bmyqkfJiroWBnVRv/GSQby+dnxxaq9MNSPjEPS/E+
 E31zjbq05gEiPItdLoBQ1A0XiyCo7kzpuOy6UCY8TPj2gtELMr/NQ+WGSqngpU+xP8Os
 USwfnSaOBE+raLAUcff07/G7TUMvuvGRvtZxW946zk0lQxRN+Ggyk2k4PtuDos7OY0aH
 SXVQ==
X-Gm-Message-State: AOAM530dZdQqRPVdkX/gRoJuQF6nY4Lel6LcRtXN0DMx6GsiiY39X6yl
 MhYQfZegKiPJVcXajZDCHD2WVjpfN8CAr/2BkysBH8RRwFwnJZVIJujhSr9B9aRix6wx/Spvfj8
 gV9dNUvjgDQk9nHe6AUvjN7wn918c9CA8qA8wpKr+hIAWCqZtxdeFnMR2sPjk5wfV/GgpBkbhQA
 ==
X-Google-Smtp-Source: ABdhPJxJSofYvRvX7pzOuHCGanKcMj5IXi9zrdACL+vb+xn3NFLl4IEd4qGUy1smJncrsYEqVikTGg==
X-Received: by 2002:a17:902:aa84:b029:da:f114:6022 with SMTP id
 d4-20020a170902aa84b02900daf1146022mr23659311plr.46.1607969508539; 
 Mon, 14 Dec 2020 10:11:48 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id y21sm22133179pfr.90.2020.12.14.10.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 10:11:47 -0800 (PST)
Subject: Re: [PATCH 1/2] target/arm: add support for FEAT_DIT, Data
 Independent Timing
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-2-rebecca@nuviainc.com>
 <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
 <284b9f4e-55b7-81a3-f1c5-7f7b6d0c9784@nuviainc.com>
 <46d7b991-d305-bd2f-91f9-cdc2ee1e73ce@linaro.org>
 <CAFEAcA9NOez16SaKsegpURPtMJDByYQ2MaeUKjQAiKhm=O-7LA@mail.gmail.com>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <8aacc648-c550-c5a9-eed1-5031cb95a5fd@nuviainc.com>
Date: Mon, 14 Dec 2020 11:11:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9NOez16SaKsegpURPtMJDByYQ2MaeUKjQAiKhm=O-7LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=rebecca@nuviainc.com; helo=mail-pl1-x641.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:37 PM, Peter Maydell wrote:
> On Fri, 11 Dec 2020 at 19:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I'll let Peter weigh in, but I think it makes sense to move the SS bit
>> somewhere else (e.g. env->pstate) and merge it into SPSR_ELx upon interrupt.
>> While what we're doing here is convenient, it's not architectural, and it would
>> be better to follow GetPSRFromPSTATE pseudocode.
> 
> Yes, I think that's the best thing to do. We've been skating
> by on CPSR and SPSR being the same thing and it's just
> stopped working.


Would you like me to work on this, or is it something the arm 
maintainers would fix?

-- 
Rebecca Cran

