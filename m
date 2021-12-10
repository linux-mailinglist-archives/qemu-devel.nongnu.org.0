Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6F847015D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 14:14:29 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfjI-0001vY-Sp
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 08:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvff0-0007v1-NH
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:10:02 -0500
Received: from [2a00:1450:4864:20::332] (port=41491
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1mvfer-0007y6-LA
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:09:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so6616400wmb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 05:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GG3cI3VL03mYS6GmxB7BMCVqnJBGb7IPs5WTXo4TRFQ=;
 b=jH47+DJOGxowuBVdFeXAk1cml3FXgb9GOw9QcGA4TaL1Yabtg0dFVLiZLTQZkerYmr
 WRIQyPOYBbO3c/yu1QSmLszqaGRYT3yd95GuptcClmaegvmgwb+5rDB9VyIXEAMuHeW7
 vewaROap98z9lM28bLnToSCqd13kh8dNtn9jJpGanszSAAuca5siG+WjHqe7IAmHIct7
 Ikt7fI8sfyor6cZJVwocX+zBbkl9mmIC6mG8UMpLaoe+sU08OIwAfW5RQYOGNdfv3QrY
 ZO36kDnuUYoGI9ToNA/3HkGotkwtRsKhhcx9a4ZTuJYxVvu9jSyivE8UvhRsIZYzR+we
 KqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GG3cI3VL03mYS6GmxB7BMCVqnJBGb7IPs5WTXo4TRFQ=;
 b=r9celUg4OaGqSFklIWnpHq47UGxXe8QHZN/y/Vmazkhk159TfTyGIe+W7s6vhk7+El
 uWyfMw36zXI1fIhCTYVZw0fX+G+O6EHgVkInaCd79BbOuZjHaRuGVr6ZAjW9DfLgIZVz
 FLNwuSLzUhr9hPSL1vwJ+vk//9Noofap2Xdv/G/oBbwX96/B24OQBnTra9bWIwesteAF
 QuuXcbofgPf/6PfS6c+o76Nwken95/CV7W9bdOkfPgae82IqwXDA0ePJcfDIOmjoZSBd
 ncegY+Z3lt9wMYUvLPNeU1JaGyp6WdSRqOS7YJoK5UQwQhMnzCcC3GErVBt172phSg0Q
 /rsA==
X-Gm-Message-State: AOAM533eN7RsvF38XAedHMwsq/pgZrjCb/vbuPTcxT171Iujy0ByTY9n
 3uR1Yc/XEmfhuA7GASemliehx8sdoSVh0Q==
X-Google-Smtp-Source: ABdhPJw73vq1pWnghmkqkKQtALdK1b1kzMMSCNOVFJX5LZschPuB0fmgg4oAoqlbkXb4EZh2jX2yyw==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr16447763wme.72.1639141788700; 
 Fri, 10 Dec 2021 05:09:48 -0800 (PST)
Received: from xps15-9570.lan (host-92-16-105-103.as13285.net. [92.16.105.103])
 by smtp.gmail.com with ESMTPSA id r8sm3267918wrz.43.2021.12.10.05.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 05:09:48 -0800 (PST)
Date: Fri, 10 Dec 2021 13:09:46 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/8] standard-headers: Add virtio_video.h
Message-ID: <20211210130946.GB382594@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-6-peter.griffin@linaro.org>
 <20211210055537-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210055537-mutt-send-email-mst@kernel.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.griffin@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Fri, 10 Dec 2021, Michael S. Tsirkin wrote:

> On Thu, Dec 09, 2021 at 02:55:58PM +0000, Peter Griffin wrote:
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
> >  1 file changed, 483 insertions(+)
> >  create mode 100644 include/standard-headers/linux/virtio_video.h
> 
> We generally inherit these files from Linux.
> Was the driver posted for inclusion in Linux?

Thanks for reviewing. Yes the Linux virtio-video frontend driver was posted
sometime back on the linux-media ML [1].

One piece of pushback then was not supporting vicodec/FWHT and also no Qemu
support [2] which is what this series is trying to address.

The virtio-video spec however is now at rfc v5. So my rough plan was now I have
something working with Qemu and vicodec I can move both the frontend driver
and the vhost-user-video to latest v5 spec.

I'm a bit unclear what the process is to get the virtio-video spec merged though.
I think I read somewhere they expect a matching frontend driver implementation?

Thanks,

Peter.

[1] https://patchwork.kernel.org/project/linux-media/cover/20200218202753.652093-1-dmitry.sepp@opensynergy.com/
[2] https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg02204.html


