Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07548AB3B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:18:13 +0100 (CET)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EEF-0002aL-Jb
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1n7EAX-0008Qj-QW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:14:21 -0500
Received: from [2a00:1450:4864:20::42b] (port=34702
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1n7EAV-00027a-7U
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:14:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h10so21808306wrb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 02:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UfiOqNQXiUNpKC4+H6q/1Ps2JD9gx9xtbgbCJ4m3nv4=;
 b=wwaO0fyVk/d0q1RrHE/Sagsu5KFvZvhV/l5eR9O//kJZLQzHGp6Iv02cVhUtgWzhmA
 97Gaqq/8e5MLY+VxD3awBdTp6qTji3pIlEG2+FwoFAC6+zHYOIGoDz1KRwZCcqjhZXA0
 Wkpn1D2esXd09+VZtuqV3gAeC4KokU1LGEahVS2SlsiE6Uokiu/48OCEWw1gNoQ25cCQ
 A89OTGzWcqzASM1QeQBUP0W1DsbSlfKU1+65Gn9eXdKTrkjwGMZVRDtIdf9jYzMQbk8L
 Uxinwo/cw6XOIBXo8rMHaSzIBw/K4gGM8DdlkeJpEPq06P7KLdq9hrhYcKp1Snc11IlQ
 YBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UfiOqNQXiUNpKC4+H6q/1Ps2JD9gx9xtbgbCJ4m3nv4=;
 b=zZbRtZdFVwmydAwt0wbfn1Y6eteRU3cTrJkRYrSIeEd4DphrzgCTfvA9TjYTTNJ6dw
 mvd4Xwvi5PhjM7tBeRRwPP3Db/DM9fQlH6R5U4adgvlVjoJXR6Kqduvq/voybX6nJixa
 FE6AZIqe/cJ9Gbe+juBsXr7nQwk+S3DKO92M8tG57YhWBmxVPDsx1ZjbDfsi+s0+pglO
 cjdmYVkp425RRIyh0TqFXPLtuEQeoddFVXr9FNaTjszcdEXYFXnZDD3ssL96uh/IIfjy
 XGMAKhk4wznIUBzXs7rkc7yu9UxNXS/yZA79c+gTp6ppr2lkQhV68SEfeMIAaaQ83WiJ
 VRiA==
X-Gm-Message-State: AOAM531CsfR9KgR7F/QrZKMNwoLgzyhbo821u8HFGD+plKJ3QiuAh3FB
 iHrNX0CQ3s/gbB8s4iMbJ7MJJA==
X-Google-Smtp-Source: ABdhPJyov6Jp1Csb8JixYLuVoQf41G+2K8BEZmiMXd4ukaQgNFTzdsoat1sd5hfHmiBSz1yT+uHrmw==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr3249911wru.536.1641896029142; 
 Tue, 11 Jan 2022 02:13:49 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id q206sm1288592wme.8.2022.01.11.02.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 02:13:48 -0800 (PST)
Date: Tue, 11 Jan 2022 10:13:26 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/3] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Message-ID: <Yd1YRkJDv35bQ/PR@myrica>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
 <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On Tue, Jan 11, 2022 at 10:02:12AM +0100, Eric Auger wrote:
> Hi Jean, Michael,
> 
> On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
> > Replace the VIRTIO_IOMMU_F_BYPASS feature with
> > VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> > global bypass on and off.
> >
> > Add a boot-bypass option, which defaults to 'on' to be in line with
> > other vIOMMUs and to allow running firmware/bootloader that are unaware
> > of the IOMMU.
> >
> > See the spec change for more rationale
> > https://lists.oasis-open.org/archives/virtio-dev/202109/msg00137.html
> 
> I guess the kernel bits should be merged in 5.17?

Yes, they should. I can resend at 5.17-rc1 along with a commit updating
the linux headers. Or is there a specific process for synchronizing the
headers?  Looking at git log it looks like scripts/update-linux-headers.sh
is run by whomever needs new UAPI features.

Thanks,
Jean


