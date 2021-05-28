Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCED393CAC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 07:18:33 +0200 (CEST)
Received: from localhost ([::1]:53140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmUtD-0007PT-Ng
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 01:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lmUsE-0006iW-Uf
 for qemu-devel@nongnu.org; Fri, 28 May 2021 01:17:30 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lmUsD-0004Ij-3w
 for qemu-devel@nongnu.org; Fri, 28 May 2021 01:17:30 -0400
Received: by mail-pf1-x434.google.com with SMTP id p39so2349973pfw.8
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 22:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pa2uxwvY7ZwN2UwE61UseAxIgiILVBUEQramO4pm44w=;
 b=S3X1mks25PPleIZVmiKdPXoykTneTBmqYjfTx0SXGxSXh5WiBatFKC7yGlQ63fJ/pG
 TmsJXxqTyBUGdE7i1HNqtJ6sJQ6cTK8xgCStLJ16Sw3Mj14aTbcDWCxQYXY0FN+4oLMZ
 0nhqWzzcVcQThWL8J1bXFCThmIRkEYc5J/ILkGisyil4rgWn3iVlfI/79ajTTEVnN/wO
 ZlYio5yhHQlIhrCLKdsLKLBmD40VUN8Ak+R+0eUP3nhYuUkvuGi82LVBTuuFhYHwlsE2
 yjnkxqFtX3tLxySyxyJE+MPmSOOQD0Vkhv/IGSZpxB3SdIreH51g2FopPtVeuf8qAx7g
 zH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pa2uxwvY7ZwN2UwE61UseAxIgiILVBUEQramO4pm44w=;
 b=XVIZMAkTMq2qbNKuhlCksMrKDXWv8w4J/TrFQX6ZlP+Z7gOHXErffu70kh1OFYcfhJ
 Ih3BqMr76N9gOXfjVqty86I5DcwZ+6KF6YITDXwNrcz+pmLqyhsNxVz8W7Vm4G1FA44u
 tTP9Jx3WwhpvI8QWYtzgjgiw/Qq9IoaRvdle7yIlVXEcaeAR2XK2j/EO0N2TMj02zdOp
 Oa/qp/ZWtVeFLv7A/jNUalb8zPeaTKyOxP8m5V3L5TZD3MMqNWAw2DaIcSfE8ZRM/kKS
 /wLkbKjWsIlMyNz6eNEz0ELFH3fLjlew1Tw79GlJ4YYDvPKULHEY7F2TiUUAQawVcpiR
 jB2A==
X-Gm-Message-State: AOAM531fdyTB1j6tYQuVcL8lF7VelvHx2LWFLZdbnmoZRWm9R9CDJl7p
 pVFo//VME+2jkugYorp2io1ytg==
X-Google-Smtp-Source: ABdhPJy01GPyFHyrozX1WX0abje01OeurCPO6YEWRdm9NoHdsbaVLOhTQddjE/qIfyuTsir345uWkg==
X-Received: by 2002:a62:d083:0:b029:2e3:c8be:14b1 with SMTP id
 p125-20020a62d0830000b02902e3c8be14b1mr2111162pfg.41.1622179046998; 
 Thu, 27 May 2021 22:17:26 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id v14sm3117883pgl.86.2021.05.27.22.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 22:17:26 -0700 (PDT)
Date: Fri, 28 May 2021 10:47:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: stratos-dev@op-lists.linaro.org
Subject: Re: [RUST] Add crate for generic vhost-user-i2c backend daemon
Message-ID: <20210528051724.yi73gvj5ow54ldtx@vireshk-i7>
References: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428122247.ymwshfuoojxzsebf@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pf1-x434.google.com
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
 Arnd Bergmann <arnd.bergmann@linaro.com>, Trilok Soni <tsoni@quicinc.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28-04-21, 17:52, Viresh Kumar wrote:
> Hello,
> 
> In my earlier attempt [1], I implemented the vhost-user-i2c backend
> deamon for QEMU (though the code was generic enough to be used with
> any hypervisor).
> 
> And here is a Rust implementation of the vhost-user-i2c backend
> daemon. Again this is generic enough to be used with any hypervisor
> and can live in its own repository now:
> 
>   https://github.com/vireshk/vhost-user-i2c

A new crate is added in rust-vmm for this and here is the new repo I am using:

https://github.com/vireshk/vhost-device

And here is the discussion happening on my PULL request.

https://github.com/rust-vmm/vhost-device/pull/1

-- 
viresh

