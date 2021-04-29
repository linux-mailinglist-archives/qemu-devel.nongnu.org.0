Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9636E59F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:11:14 +0200 (CEST)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc0pN-0001HP-7K
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lc0o6-0000ou-6Q
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:09:54 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lc0o4-0001nC-8D
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:09:53 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o16so20649694plg.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UMabfqlUxzRETAW1Vq6TUtjVCtCaQLS+XMoxqICXnqI=;
 b=vWXRMOD2DO9bDTW/TcisSP5Z86kR9chnUxjGxpywxU9j6nXTTjLWQmLPmGvxFzvyeg
 VUIiig2OY13SaRJXgo0wnSYcqWlFMswKSQiO6jni3r8us8qD4C/BlXebGAIVaYgpLKw6
 ctrHs0+50LMlGRoAmOtP//yXfqLoOopb4ifYz2cohZ444WYC8H+PGUSsl4WdVs9rGErt
 RIFAZ6R1JDwE0KxD3enQIiAgkzgPVKLKKOoGCZq1t1xsS4BNLpII3HL3AcMJ9VU/PWT1
 aAPRthgayqi3O51aLgNSSRJoNuLCURANeHl8qRcTmFR6WuH3nsVEVKXph/i0nxv/mHE9
 Y9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UMabfqlUxzRETAW1Vq6TUtjVCtCaQLS+XMoxqICXnqI=;
 b=l/BeI3Sxkiqb9MKGwjwHjZtZrlkAg8sxpSfUjTdjhsXXafjsx50bjhn1bhCKb2D9nb
 lUNgx1dwj/TxBIW5pYVzDNMzgKE1ZKkFCFdl0EdJTWod/rFyUVZxRRIcfVP+/Ea0I2wK
 9JQTysykR41leYCFGXZdm52Jb69QLk+k266KpZc10siOQxOoQbA+oRb+dYjnYV7FSoM9
 z/Aa2JJSUQRE+JxcrjePcxB4Glr0OilPGHQxvDRExwiDIsWRCPS5rE8HzQH5I+mjZgol
 AqutDHaS/PiwXSuJ3gRGVfo/wscf+6xk+b33vextyN9Rw3MrGuTbEjnGBDZNZbttLCrU
 6l4A==
X-Gm-Message-State: AOAM533py+U/QgU4w29uDt2CL9nCtU/1sAAhSN3yat36F6vnNaqMdL0Q
 btOS+u4zyN6z3wcE4wNdZ30ntw==
X-Google-Smtp-Source: ABdhPJyicix2Pv2Sd7kfag4jYP2GHB95F6XqYPp7i4u+VywmVcDbsZuJeYtd29bf7lzls2DjO2ZRdQ==
X-Received: by 2002:a17:90a:c203:: with SMTP id
 e3mr11499028pjt.168.1619680190178; 
 Thu, 29 Apr 2021 00:09:50 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id s43sm1540089pfw.164.2021.04.29.00.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 00:09:49 -0700 (PDT)
Date: Thu, 29 Apr 2021 12:39:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Trilok Soni <tsoni@quicinc.com>
Subject: Re: [RUST] Add crate for generic vhost-user-i2c backend daemon
Message-ID: <20210429070946.a6tw2gzzs6qyrtz6@vireshk-i7>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
 <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62f.google.com
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
 Bill Mills <bill.mills@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28-04-21, 17:13, Trilok Soni wrote:
> Viresh,
> 
> For rust-vmm, you need to create the new issue in the right project.
> You can probably pick up vmm-reference project at rust-vmm and ask
> for the new crate.

Done.

https://github.com/rust-vmm/vmm-reference/issues/118

> There is also bi-weekly meetings which is attended by me, Vatsa and
> rust-vmm developers where it can be put up as agenda. 

That would be great.

> The minimal requirement for the new crate is to have less (or almost
> none) dependencies on other crates so that they can be independently
> tested in the rust-vmm CI.

It depends on a bunch of crates, specially vhost and
vhost-user-backend.

> Anyways, please file a new issue and I
> will ask Vatsa and others to comment there. 

Thanks Trilok.

-- 
viresh

