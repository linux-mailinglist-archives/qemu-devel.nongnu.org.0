Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6EA389C45
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 06:02:47 +0200 (CEST)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljZtV-0007qM-Mx
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 00:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1ljZrZ-00079R-LD
 for qemu-devel@nongnu.org; Thu, 20 May 2021 00:00:45 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1ljZrX-00015T-Ks
 for qemu-devel@nongnu.org; Thu, 20 May 2021 00:00:45 -0400
Received: by mail-pl1-x632.google.com with SMTP id a11so8250176plh.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 21:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aiu3ibm/H7GrhfXyW+tRKR+T3tcyXbvhlvqPdlvYy4c=;
 b=NLAFGeaSIMEO9qirmnbDJLwhMtmV5XLeLyo6I2tZGHFn2G0hcygyNapg2SCC6mk/2E
 rSCb2Uqg/H51CS7f17eL8z/BThE+szRf/nBUvtiipN1Bx2DjRTX425tXDE9hBjflvaGq
 pyKBOGGG7gUMbd30VsBKJvl7uysNeMi0V+9j5v7VfmWlyZzsoRaNKtxW42UUg+4CK9uc
 5B2VTOkmEe9VgejvmohixzmTM7K/oFQtDLj4Wf3pFHK6M8h39UO+S/hpLcMhK5tczNGk
 wUnpTSGAonxANWDuzvpfRA9xLnOb/Irlf0Sm0zRugQmHvpg1KrnazXGrDT2GsvnSnP+z
 aK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aiu3ibm/H7GrhfXyW+tRKR+T3tcyXbvhlvqPdlvYy4c=;
 b=tHsaA0aU9lHWxUyIpSlrWkdeR1EjssR+MwX9jTrq9DrVcXgxBncd1yHQs3N1jm+Kox
 0+QCXYQt2v0ZAFrSK6AdkBmHQlW43/Sp7V6384sRyPU74cAJhg4jhAIUEzex7RdkRYaH
 mlj/lk6g8kumLE4ed2jRJ+47s89yS+B4E1DG/fAa622oX3WN/uLyTF953hmczYXHsfh1
 SzYydWWbFZV7Qi1J3MtcIy6Dq2ns5mthqz7Vtfr4prM3iPs1l7jffQcMIBq81pzH65+X
 3VqVndWX9/6yKVVplQxKI4uoyhxKgoCmcbchiuhxJ81y4RO1svFmMcUYvbzbnj9/1j4A
 qVqg==
X-Gm-Message-State: AOAM532DVM+9js7I3QtJ4IXWMmqEnBDyvd7n2FOG93TMEPTrp/d2TUa/
 +s7l7Yv3Hzrwd5u64dQm5WCLOw==
X-Google-Smtp-Source: ABdhPJwfSTcc3DYduSfIrpDuI62gyYNrPwLsX/Rq4NGfTFnxQ2yPrvr0Ck9yD1g6n6dItsJjrwcW1Q==
X-Received: by 2002:a17:902:9b83:b029:ef:4dd5:beab with SMTP id
 y3-20020a1709029b83b02900ef4dd5beabmr3296407plp.76.1621483241267; 
 Wed, 19 May 2021 21:00:41 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id a190sm693802pfb.185.2021.05.19.21.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 21:00:40 -0700 (PDT)
Date: Thu, 20 May 2021 09:30:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Trilok Soni <tsoni@quicinc.com>
Subject: Re: [RUST] Add crate for generic vhost-user-i2c backend daemon
Message-ID: <20210520040039.xiyk26hmub3os3i2@vireshk-i7>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
 <BY5PR02MB6772BFF2315EEF33E187D468B0409@BY5PR02MB6772.namprd02.prod.outlook.com>
 <20210429070946.a6tw2gzzs6qyrtz6@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429070946.a6tw2gzzs6qyrtz6@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x632.google.com
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

On 29-04-21, 12:39, Viresh Kumar wrote:
> On 28-04-21, 17:13, Trilok Soni wrote:
> > Viresh,
> > 
> > For rust-vmm, you need to create the new issue in the right project.
> > You can probably pick up vmm-reference project at rust-vmm and ask
> > for the new crate.
> 
> Done.
> 
> https://github.com/rust-vmm/vmm-reference/issues/118

The issue got moved a bit and we have received good response as of
now.

https://github.com/rust-vmm/community/issues/106

-- 
viresh

