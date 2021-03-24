Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DF73476C7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:08:02 +0100 (CET)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1Mo-0006OK-04
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lP1Kn-0005fP-8L
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:05:57 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lP1Kl-0004Kp-E8
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:05:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id j25so17046387pfe.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 04:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H89iNBr67ffftkr8tphOcqtHVXciya52vUaHYzo8oM8=;
 b=ipSqsPIkbQ/VVtubNTezUy7eh6d350ogjc2MvX85gs9LN1h98QVyHT+h/yz8g0xR2a
 VsDIuETI1YBbCvHhYP8juUg7SmyeKXzR873a+bSPSN/m4okOeW9lpjStFN6Fv8lM8Nz6
 Z8KkJu1Dp+r8iPJM3+cZQjJRo+HLzTcpJZ1yBxfvaSbV9K8W0jQcQHMTKE1zsCE3uyrr
 eqTaYa/ChLo+KmTKUiQyC+NtFpaX8kq5Oi1CrHxTUtZR9PFyxxvmaqbmlNGtGbUhUDni
 GFqICOxKCxZHLTX0BIH6/PznaE+MVRHVnOqP/BBU6aGsChfB0viTP7uuw/++PNToCKig
 RzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H89iNBr67ffftkr8tphOcqtHVXciya52vUaHYzo8oM8=;
 b=o8KXDuhuuXZ5piGji0DHQsCpHJSiw4hXbYtmg+WGxFs+4FUdhBJFSIXsYwiUBknZ3R
 jABEmepoovqt4GzzEPZgWyFF/etG3jliTNSNLVJWcLqwV/KOVAORlfpS/roYTFjva71e
 Re4UESXwsQ8Qu0kse8CzpKRFoDgOgKNay+9Z+qhdOay/wjSaGuTtbPKLJeo8CpkOd8An
 dtRlD3qL7KyBPoBiptTmmtqcLJN7NH8Rjyq74lYMioyatErXDrWo9UVriunxaJOWcRsW
 Q+AGLoNtLyHgp7okoJH2+5E2WEY22WVCJmNhOx8uMGM+nDf2Wu06OD3LCecJzS92QctE
 LLQQ==
X-Gm-Message-State: AOAM533rDxW78uizEoCgX7k3CeMio3IJCJwfb+jGzdfZaU+RMiKJy8Qt
 FNCxBiXqDHHzAZm+DeCRPLdrYQoeBmTy+w==
X-Google-Smtp-Source: ABdhPJwrw57ahVRFHWXF6KjOfvE+XKcCP64qmoORW97ioR4oGfbprfDlpdPDB+D3xNOzd9zLkxFduQ==
X-Received: by 2002:a63:f546:: with SMTP id e6mr2540781pgk.299.1616583953274; 
 Wed, 24 Mar 2021 04:05:53 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id i1sm2078094pfo.160.2021.03.24.04.05.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 04:05:52 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:35:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/5] virtio: Implement generic vhost-user-i2c backend
Message-ID: <20210324110550.3ganqkapxnanrdxx@vireshk-i7>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <161657176613.22034.8612668942319143176@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161657176613.22034.8612668942319143176@72b6d80f974b>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: vincent.guittot@linaro.org, jie.deng@intel.com, bill.mills@linaro.org,
 arnd.bergmann@linaro.com, mike.holmes@linaro.org, alex.bennee@linaro.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24-03-21, 00:42, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/cover.1616570702.git.viresh.kumar@linaro.org/
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..

I missed the fact that we have an implementation of checkpatch here as well. I
have updated the patches already after running checkpatch at my end now, and
will fix them while sending V2.

-- 
viresh

