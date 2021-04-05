Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FC5353D5B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 11:41:41 +0200 (CEST)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTLjo-0007aH-6h
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 05:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lTLha-0006lE-S5
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 05:39:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lTLhS-0004ji-Sv
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 05:39:19 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso5565390pjh.2
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=xRFSLtTUkJNS/kRSzVb05Og1owsa1qLWiyLY9jSwweE=;
 b=cCIcghUvZnoL9RjOfssMAmu3265mBtxTMHF9RhKTcOarPFf1vkNWTVsd4YnlItgjCL
 95zsPp2iJTWbD2YADWF61jSryAlvO79FyBDuAC/s3Ivr+7jV3gF+eOS8YPQEtYT2TGAt
 rUdZmsp7KlaLWAw+RU8HtaD1l9uR/NG8gD6+PEHIsbhxlkKl8GudfGquGLAbRU1/KvYC
 hDH0GPjTXJZaD6g0zLwQQkyU+zl7XGvEgB8DISu7D8HFR9jDK/mDk+95xOKudkk10QhL
 bBnRrnfU4zI6anydZrJWzwwGNkS3JCznhYHNBqprZ085v78DkNklOqET+IhyqGHufVhD
 spOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xRFSLtTUkJNS/kRSzVb05Og1owsa1qLWiyLY9jSwweE=;
 b=JQps0YM2dqJ19g21cDlA0/jGHkUfMC9H5BSHTZ1X0ZHt4JcErokJmiLIirV+eqrZqb
 nOSX17Z9zi4X/EkJadUwfUZKVWwGr+fnpXI1k2rWIGt6db2A/bSDMtISI8mjrdse+CMq
 kQoauNtXXyJmlKGb2ivNTkO/grWUl4mRyvobPSbfAPd8NXknMl6dQU/BP3E2TafC7lC0
 5NBA9b2R+G2UjjcchM/EHRnQkRcSbgO8mSb6+Tx7geia0a6RPOkQ1BsuTuzZ3Lp0QXtW
 woAChQNLx1rsr8hPSNjRRFwJvfn5aZAc7ZEEe3YQNzzFTMlcb/U+I+TH6xgnjIHMmBe+
 blPg==
X-Gm-Message-State: AOAM530on3fhuZtndyxS1fcLT26rs4Lj+MXBW6m3WLoors5gzge/a4vJ
 EaEdJ8xDDCncAfLYNwGSzX2yYg==
X-Google-Smtp-Source: ABdhPJz8v4zzCUjZBGqBFLZx/+LvEjhaFClOs667XykBQlKy0FfrEiC5djCfSpUkgzZgGd+gHrHklw==
X-Received: by 2002:a17:90a:5d09:: with SMTP id
 s9mr25428794pji.228.1617615551903; 
 Mon, 05 Apr 2021 02:39:11 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id w79sm15342395pfc.87.2021.04.05.02.39.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Apr 2021 02:39:11 -0700 (PDT)
Date: Mon, 5 Apr 2021 15:09:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH V2 4/6] tools/vhost-user-i2c: Add backend driver
Message-ID: <20210405093909.rn6xlcmj3tpfjgh4@vireshk-i7>
References: <cover.1617278395.git.viresh.kumar@linaro.org>
 <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
 <87eefu13c4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eefu13c4.fsf@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01-04-21, 14:43, Alex Bennée wrote:
> > +        /* Parse clients <client_addr>[:<client_addr>] entries one by
> > one */
> 
> Then this would be:
> 
>      **dev = g_strsplit(cp[i], ":", 2);

There can be any number of client devices present for a bus, not just 2.

-- 
viresh

