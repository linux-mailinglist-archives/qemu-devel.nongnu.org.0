Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271B1494647
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 05:04:36 +0100 (CET)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAOgc-0001bn-OO
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 23:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nAOen-0000Vb-PT
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 23:02:42 -0500
Received: from [2607:f8b0:4864:20::62c] (port=44815
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1nAOel-0004Vc-Ki
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 23:02:41 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c9so4100529plg.11
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 20:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=c/2GEwMyLhntaa1kTZFuJeaNUiwTpnxZmSoHuxlVnUo=;
 b=Dznnzni2gDyGLgFeSFHOrN5fQ3UaA9HNypjq2OdmbGrt30hqi25yQdpmf57wRRHcGb
 Dh3cyWxi/qM2fqlZWTwy7LTJP0+d94GpCslErlqYr2ILAS7G10cwj77Rv9pNeuiP/nAV
 +gtsToPBojmMVnClRScAKwv7xSUu+h1trBTS4m9q7vvs6l4cUT5qG8aESGGEem0CRMk9
 5J1a3XyOg5nz/Sr9eHlPhTJkWIKVoZgbo0yT/NmgKyx9C7bxiW2PnkIHDcg3wpv5W+W1
 9Nw+J6BV3dLK5l6hz0qUPBQK/u56gKVYH0GRsC96MSwvmyFy70Bj3Jdr1eHSUG5rfjW8
 e71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=c/2GEwMyLhntaa1kTZFuJeaNUiwTpnxZmSoHuxlVnUo=;
 b=grCEyXHy18chJ+xquPOne0PfzSkDDjbVkpAOamH+Fwq/IVRHYcr5Dj8eBnrcwXZCMa
 PHpHxutbZ8cKMQyk1hCSF2+XhA+xfrwzduSMTW3NHTJnTc0rI1WNsmNmWgzyWUQYHII2
 nPZRNuprvw3qll/d2LXHughXBKHdNcdLiKKWVSm0CpOW+zZA8DuU+AQh+YUfFpQJdwPs
 O885NhRzTMcN5uTtnQDnup8posKeZhWwPuqCkithnQvvO5+/ozikOznNET1JnMRo2oPY
 9ywCJ268++ZYbUw40bscWKeLohhOAMDLdbX0yxcjI+syXBaJccTEeypyPHnyZ/7wjc5J
 P7ow==
X-Gm-Message-State: AOAM5323Besgohevw1O/ZUKtjKkDxIy9StEUmhMq0HqbAsdWyO53/4Zq
 m6mmvUQBEnHICfG8cmj9YWWTzQ==
X-Google-Smtp-Source: ABdhPJyueAn5m8zZC4n/VX2IQGTYiOsy8DJuNZV2DZ+KJJKJQWjJeAGQmqAzM6U8GzD1F0m9cCGyTQ==
X-Received: by 2002:a17:902:cecb:b0:14a:5668:2673 with SMTP id
 d11-20020a170902cecb00b0014a56682673mr36364576plg.26.1642651357420; 
 Wed, 19 Jan 2022 20:02:37 -0800 (PST)
Received: from localhost ([122.173.184.146])
 by smtp.gmail.com with ESMTPSA id n22sm1042344pfu.193.2022.01.19.20.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 20:02:36 -0800 (PST)
Date: Thu, 20 Jan 2022 09:32:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Message-ID: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220117034606-mutt-send-email-mst@kernel.org>
 <871r16br9n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871r16br9n.fsf@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17-01-22, 10:11, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> >> Hello,
> >> 
> >> This patchset adds vhost-user-gpio device's support in Qemu. The support for the
> >> same has already been added to virtio specification and Linux Kernel.
> >> 
> >> A Rust based backend is also in progress and is tested against this patchset:
> >> 
> >> https://github.com/rust-vmm/vhost-device/pull/76
> >
> >
> > I'm reluctant to add this with no tests in tree.
> > Want to write a minimal libhost-user based backend?

I actually have one already, that I wrote before attempting the Rust
counterpart, but never upstreamed as I am not sure if anyone is ever
going to use it, as I am not. And I thought what's the point of
merging code which I will never end up using.

I am not sure what test I can add here to make sure this doesn't
breaks in future though.

> This is going to be a problem going forward as we have more out-of-tree
> backends written as a first preference. While the first couple of vhost
> devices have C implementations in contrib before we worked on the rust
> version I think we are getting to the point of skipping a first C
> version for future devices.
> 
> However I notice we have qtest/vhost-user-test.c so would that be enough
> to ensure we can instantiate the device and a basic vhost-user
> initialisation sequence doesn't cause it to crap out. This obviously
> won't be exercising the virtq processing itself but does that really
> exercise any of QEMU's boilerplate anyway?
> 
> > We also need some maintainers to step up.
> 
> You mean more reviewers for the vhost and virtio sections of QEMU's
> maintainers?

And I too was waiting for replies on these. I can surely write
something up if you guys feel there is a need. I just want to
understand it better.

-- 
viresh

