Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AA389CE7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:08:30 +0200 (CEST)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljav7-0007mb-Uz
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1ljatX-00076h-4q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:06:51 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1ljatM-00041q-G0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 01:06:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id k15so10995198pgb.10
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 22:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UZ66TeH2xc0p6ihu6ezywQl7M/echoPjZ2tfUMmNGnc=;
 b=jNH44+0FVFe6sECi94h20EVW69uqP7t5qu1/MzSD65fcx1c7jOhYCNLXyc0LdKDJrJ
 1zkNx7gmxvRFHhW3awyaQnVEKrA2Oz8mjqSmgCI3IR2P8ZHMcl1N3jOKN3E21BqqVJJb
 d55lZICj/5DH+W5oYk9SDTdvRH0M5hDyGlucT6QEFpHiJSjf4Kec+T88rFPj0UX3+vXe
 gx3KlIzmY/KExlFmuWh5neGox57gPMMuzWWIA3cZJiWVrST5/3O5EyY1EBgGrBBX5wrw
 LZjkWExt28IvxgorqtLw2hjuwp3olNxcyrNQriyfLbfC5KmJmRhVL+MrLW+ZGCi+Vggq
 Bjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UZ66TeH2xc0p6ihu6ezywQl7M/echoPjZ2tfUMmNGnc=;
 b=lUVSHStW+GMfBUtH7t1GlfAnegad0c3i2Ksefrawe72j6UhnUusTfb+wXseqGSg+lB
 P2zjDnrYyU20zbzg8lRrfGnlVG+6H+lcnL22Z81nSWYhciqhE5es5VE/7oTMI18t3lwL
 ZDoF/fojduCfnoRmC/GPR4Np4dHzRoRLliHAE1eQQwpktmeYYzeEPZRuj04k/k9ccUya
 M0UaIpeacfwdW1Hj2yuJjrCj61ytqi+8cj9RcQxs+kA/3juvPLKWpr88+zK0X78CesWx
 2Vw8onOxwQ8Ihrd2M08y+tKJojk9ilZhMCeYzMbvUbvYrLeAroifRqbcRsUEfpBakq/o
 NW5A==
X-Gm-Message-State: AOAM5317p3oBf4dIHjbK/qYgGKXERnrG5w9dPCkIhzA/eQfzAyMfyjPk
 SDCzoP2DzTq8F0zSJD4MIfzJHA==
X-Google-Smtp-Source: ABdhPJw8uhhT/tB7N4wRPahV47EPgGvPQjRBr+5KhIa0T9Y+zv+XdM/LBnFMR1SkhhhZgk5re8mW2Q==
X-Received: by 2002:a05:6a00:2482:b029:2cf:2ec6:878f with SMTP id
 c2-20020a056a002482b02902cf2ec6878fmr3041183pfv.4.1621487198612; 
 Wed, 19 May 2021 22:06:38 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id s6sm926522pjr.29.2021.05.19.22.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:06:38 -0700 (PDT)
Date: Thu, 20 May 2021 10:36:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Trilok Soni <tsoni@quicinc.com>
Subject: Re: [RUST] Add crate for generic vhost-user-i2c backend daemon
Message-ID: <20210520050636.wdvn4qsnjx7n7pmu@vireshk-i7>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
 <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
 <20210429070946.a6tw2gzzs6qyrtz6@vireshk-i7>
 <20210520040039.xiyk26hmub3os3i2@vireshk-i7>
 <BY5PR02MB6772DD26168B1E7106AD4265B02A9@BY5PR02MB6772.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR02MB6772DD26168B1E7106AD4265B02A9@BY5PR02MB6772.namprd02.prod.outlook.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x530.google.com
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
 "Trilok Soni \(QUIC\)" <quic_tsoni@quicinc.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-05-21, 05:03, Trilok Soni wrote:
> Thanks Viresh. 
> 
> Top posting since somehow I am not getting rust-vmm group emails on my
> open-source email ID subscription. I have received Vatsa's email on the
> Hypervisor crate on rust-vmm mailing list but not this one.

> I am not sure you
> are receiving the rust-vmm bi-weekly meeting invites,

No, I am not.

> i2c crate was discussed this week. 
> 
> https://etherpad.opendev.org/p/rust-vmm-sync-2021 - notes from the meeting and I have forwarded series to you. 

Yeah, someone posted this on the i2c issue as well.

-- 
viresh

