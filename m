Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9A4AF3F5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:23:07 +0100 (CET)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHnsA-0004xW-0n
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHn84-0003dY-Ra
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:35:29 -0500
Received: from [2a00:1450:4864:20::32c] (port=34469
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHn82-0006CZ-O5
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:35:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2359934wmb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 05:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ami02QQvhp0Fh4j40WGX7wfQoYqmX+fNZJnee8w0VpM=;
 b=cWkVAOmMqTj48ZS56gs5WoX5y+dgiKxxOYyXfRhRf3PPySX5MBIbOghZ4VrpWBxVLk
 GgpqHvtip/gX+YD76HQoEUp2fp/5E+V4vzK2lza7RAQyBRKhHJWW4Es76ZoaY+gOomP0
 KKincPFIcKc+z+GMWWCi9FCkvCf5FA+gHtyA0sMyOvVYZTfNbN3LSDjsXlM/rQDswbK5
 kcex3LCplQg+1PxaWqWc88/s23dXtpn3R4XI5bNY8tW+9vx3kklD6qSsa9B7qdUH+XYx
 BE0nv/2q06XWELz7tVjwkVBDrNm4fa35u3VgXXkzXrP2NDAZ5RE6WvgRvvqZ7H/qB7n4
 5ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ami02QQvhp0Fh4j40WGX7wfQoYqmX+fNZJnee8w0VpM=;
 b=4KsramfyZ50CXH0PYH4DabcgLKSxOjlU5ahKwP/P1nQ8RGYKBJe4lssGRRgXrRabSI
 WGQkSy4jCn5n+3BDN91Jy4XIP1JFwINWd5zYuijtpFrdiN4jGS11EqJt4gBs0rvDTFZC
 vzQvorzmBbCQQy/91w9LN6TtAxdlQanILMMN+LieKTEJ96b6vFSLGdO/GWHvgQl/x8/K
 3gJot16E0r8OlHJbnhneXjwKdHDNUemn3nA3dTBq5ZZV4Pza5yTCMYZxMCRPi9wjToVa
 bNhswqMu0Ogwg7412UlcBKc7+HnABLiRgOmqVjctuytFQJh5I1d3MVm8jb4X9bF46VBh
 wgCQ==
X-Gm-Message-State: AOAM5325pu6zjph0VTGCKtet41kV+NmroLjmW/xAacuyBDHDMBeXQGAI
 soIfPUDRWGURG8ASBOyDZeiOqKDMUndqNzJAai9aAw==
X-Google-Smtp-Source: ABdhPJzxVFc2ym0fVgW+UG6QyUsMuxfAr8SVMU/M9ES2Pn/QuLedkh8sS4+K+ZgmPrBrp7i6jHuZk9lPvKns8/5XVZs=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr2103506wmf.133.1644413725198; 
 Wed, 09 Feb 2022 05:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20220207213039.2278569-1-jsnow@redhat.com>
In-Reply-To: <20220207213039.2278569-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 13:35:14 +0000
Message-ID: <CAFEAcA8Diwoioh6U95Q_c8y+cjsuVRv-VvW89Ngp9a2k47UuiQ@mail.gmail.com>
Subject: Re: [PATCH] Python: discourage direct setup.py install
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 21:34, John Snow <jsnow@redhat.com> wrote:
>
> When invoking setup.py directly, the default behavior for 'install' is
> to run the bdist_egg installation hook, which is ... actually deprecated
> by setuptools. It doesn't seem to work quite right anymore.
>
> By contrast, 'pip install' will invoke the bdist_wheel hook
> instead. This leads to differences in behavior for the two approaches. I
> advocate using pip in the documentation in this directory, but the
> 'setup.py' which has been used for quite a long time in the Python world
> may deceptively appear to work at first glance.
>
> Add an error message that will save a bit of time and frustration
> that points the user towards using the supported installation
> invocation.

While we're on the topic of python installation, is there any way
to suppress or otherwise deal with the warning Meson prints out?

WARNING: Broken python installation detected. Python files installed
by Meson might not be found by python interpreter.

(I vaguely recall tracking down a meson bug, and this seems to be
some issue the meson developers have with the way Ubuntu/Debian
have done their python packaging. But I forget the details.)

thanks
-- PMM

