Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1884A8224
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:14:41 +0100 (CET)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZ8R-0000CG-Lx
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFZ73-0007x9-Bc
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:13:13 -0500
Received: from [2a00:1450:4864:20::436] (port=36671
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFZ70-0003zw-Pk
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:13:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id u15so4018490wrt.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KHRZTe2iSOilFAndb0mcsglhexwjVZZNvhxEhX8xsqc=;
 b=no4B67iUA47c1QTjIA+WDPmc52tJnoYDOxBce9dFdsFm4tztacXJ/faPromApgKzS0
 Zf8AqV2wj7Fy+/ZKf9YoqzI7xzB3kT734aGqlG4TveKlyBj36YBPUxrGi+/KwhufM26h
 xQipkBtXSh3qmIh9cw3lnBEOHWALizRDoQhk2q5GVRWRDdm/MO1BfHJPz9Z/RZygv/aT
 CM42ZqmVt+yp40kpbs6hLJ1SHyGmYknesZK5BXCYU+uPG/stqlIFIJt0rBbd0sKn6Go8
 l4RjDLBVvJYnawG7frYh8cs9zlQLv/6uNA4DYdMRhMdHB6CNmgC1QHPhImTZeiEyP6br
 Hr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KHRZTe2iSOilFAndb0mcsglhexwjVZZNvhxEhX8xsqc=;
 b=gv+rBNrQQfBd5f3m8y/6qxE93evyuAyFy5oNMhO2zjMj+h3NTWg0H3i6R5KmR55fcd
 XjXibrdQv7aG4zjUFoQPU7LB5nx6WHfL9tEQGxdBxJNTndy4if16fwTsVVXGP442C0u9
 n0FA7Fu+IKeEwkh+F4cNT2JvNRZeWsLX5yOyLEdb1TZPk4NAlnMsGI0fyHSNgkJJcVRH
 CWVyxYLHegNZNpV4wQklal5dGR7iuFetevhp3MWgJI/5FFzBZ/NSS0ZLuY8xIt5UOxeI
 t2Cpk/eGGv5hEMXXzhYz/pXBBZyS/DpyRQJmJQzeZ+Y2U8Vq3S2TKkb4dSwV9QN/bK0t
 TBlg==
X-Gm-Message-State: AOAM531vFZSfVWtGiKPhoNxDJMruTjKWgUIdhDOz9RI8ZhEhlWnmmLJi
 QOKJfYJ7aknmEVU/5BDa1oP62g==
X-Google-Smtp-Source: ABdhPJxpDmWeNw0W32TjG54yiMYhICBQIMj6wPJviJ2fxoXu+WvOIlOwXUddQspf19Zgx+pFYfvi9Q==
X-Received: by 2002:a05:6000:84:: with SMTP id
 m4mr28324722wrx.257.1643883187916; 
 Thu, 03 Feb 2022 02:13:07 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
 by smtp.gmail.com with ESMTPSA id p14sm5589326wrr.7.2022.02.03.02.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:13:07 -0800 (PST)
Date: Thu, 3 Feb 2022 10:13:05 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/8] vhost-user-video: Add a README.md with cheat sheet
 of commands
Message-ID: <20220203101305.GA371411@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-2-peter.griffin@linaro.org>
 <875yqqcocq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yqqcocq.fsf@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Thanks for your review :)

On Tue, 11 Jan 2022, Alex Bennée wrote:

> 
> Peter Griffin <peter.griffin@linaro.org> writes:
> 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  tools/vhost-user-video/README.md | 98 ++++++++++++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 tools/vhost-user-video/README.md
> >
> > diff --git a/tools/vhost-user-video/README.md b/tools/vhost-user-video/README.md
> > new file mode 100644
> > index 0000000000..c55e0a7b68
> > --- /dev/null
> > +++ b/tools/vhost-user-video/README.md
> 
> I think as we want this to be visible to the user we should put it in:
> 
>   docs/system/devices/vhost-user-video.rst
> 
> with the appropriate update to device-emulation.rst to include it.

OK, will fix in v2.

> 
> > @@ -0,0 +1,98 @@
> > +# Overview vhost-user-video
> > +
> > +This vmm translates from virtio-video v3 protocol and writes
> > +to a v4l2 mem2mem stateful decoder/encoder device [1]. v3 was
> > +chosen as that is what the virtio-video Linux frontend driver
> > +currently implements.
> > +
> > +The primary goal so far is to enable development of virtio-video
> > +frontend driver using purely open source software. Using vicodec
> > +v4l2 stateful decoder on the host for testing then allows a pure
> > +virtual environment for development and testing.
> > +
> > +Currently the vmm only supports v4l2 stateful devices, and the
> > +intention is it will be used with Arm SoCs that implement stateful
> > +decode/encode devices such as Qcom Venus, RPi, MediaTek etc.
> > +
> > +A Qemu + vicodec setup for virtio-video should also allow for
> > +CI systems like kernelci, lkft to test the virtio-video interface
> > +easily.
> > +
> > +Currently support for VAAPI or decoding via libavcodec or similar
> > +libraries is not implemented, but this could be added in the future.
> > +
> > +Some example commands are provided below on how to run the daemon
> > +and achieve a video decode using vicodec and a link to some test
> > +content.
> > +
> > +[1] https://www.kernel.org/doc/html/latest/userspace-api/media/
> > +    v4l/dev-decoder.html
> > +
> > +[2] https://lwn.net/Articles/760650/
> > +
> > +# Guest Linux kernel modules
> > +CONFIG_MEDIA_SUPPORT=y
> > +CONFIG_MEDIA_TEST_SUPPORT=y
> > +CONFIG_V4L_TEST_DRIVERS=y
> > +CONFIG_VIRTIO_VIDEO=y
> > +CONFIG_GDB_SCRIPTS=y
> 
> Is GDB_SCRIPTS really needed here?

No not really, it just makes for a nicer development env as you can have GDB
attached to both the kernel and the daemon, and gdb scripts gives you seom nice
python helper commands for parsing kernel data structures.

> 
> > +CONFIG_DRM_VIRTIO_GPU=y
> > +
> > +# Host kernel modules
> > +CONFIG_MEDIA_SUPPORT=y
> > +CONFIG_MEDIA_TEST_SUPPORT=y
> > +CONFIG_V4L_TEST_DRIVERS=y
> > +CONFIG_VIDEO_VICODEC=y
> 
> this last one isn't set on the default Debian kernel so it might be
> worth mentioning that.

Will fix in v2.

> 
> > +
> > +# Run vhost-user-video daemon with vicodec
> > +# (video3 typically is the stateful video)
> > +vhost-user-video --socket-path=/tmp/video.sock --v4l2-device=/dev/video3
> > +
> > +# Qemu command for virtio-video device
> > +
> > +-device vhost-user-video-pci,chardev=video,id=video
> > +-chardev socket,path=/tmp//video.sock,id=video
> > +
> > +# Example v4l2-ctl decode command
> > +wget https://people.linaro.org/~peter.griffin/jelly_640_480-420P.fwht
> > +
> > +v4l2-ctl -d0 -x width=640,height=480 -v width=640,height=480,pixelformat=YU12
> > +--stream-mmap --stream-out-mmap --stream-from jelly_640_480-420P.fwht
> > +--stream-to out-jelly-640-480.YU12
> > +
> > +# Play the raw decoded video with ffplay or mplayer
> > +ffplay -loglevel warning -v info -f rawvideo -pixel_format  yuv420p
> > +  -video_size "640x480" ./out-jelly-640-480.YU12
> > +
> > +mplayer -demuxer rawvideo -rawvideo
> > +  format=i420:w=640:h=480:fps=25 out-jelly-640-480.YU12
> > +
> > +# Enable v4l2 debug in virtio-video frontend driver
> > +echo 0x1f > /sys/class/video4linux/video0/dev_debug
> > +
> > +# Enable v4l2 debug in vicodec backend driver
> > +echo 0x1f > /sys/class/video4linux/video3/dev_debug
> > +
> 
> and cut here...
> 
> The rest can probably be dropped from user facing documentation as long
> as we record it somewhere ourselves (is it in the cards?).

Yes it is in the cards, will remove in v2.

kind regards,

Peter.

> 
> > +# optee-build system qemu virtio-video command
> > +make QEMU_VIRTFS_ENABLE=y QEMU_USERNET_ENABLE=y CFG_TA_ASLR=n
> > +    QEMU_VHOSTUSER_MEM=y QEMU_VIRTVIDEO_ENABLE=y SSH_PORT_FW=y run-only
> > +
> > +Current status
> > +* Tested with v4l2-ctl from v4l2-utils and vicodec stateful decoder driver
> > +* v4l2-compliance - reports
> > +Total: 43, Succeeded: 37, Failed: 6, Warnings: 0
> > +
> > +Known Issues
> > +* 6 v4l2-compliance failures remaining
> > +* v4l2-ctl 0fps misleading output
> > +* v4l2-ctl sometimes reports - 0 != <somenumber>
> > +* Encoder not tested yet
> > +
> > +TODOs
> > +* Test with a "real" stateful decoder & codec
> > +  (e.g. Qcom Venus or RPi).
> > +* Test more v4l2 userspaces in the guest
> > +
> > +Future potential features
> > +* Emulation using libavcodec or similar library
> > +* Support for VAAPI, OpenMax or v4l2 stateless devices
> 
> 
> -- 
> Alex Bennée

