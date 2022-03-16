Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0752E4DB548
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:48:58 +0100 (CET)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUVtQ-00026l-N7
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:48:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suratiamol@gmail.com>)
 id 1nUVsM-0001Db-Db
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:47:50 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=35631
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <suratiamol@gmail.com>)
 id 1nUVsK-0003yN-RN
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:47:50 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id o5so5201675ybe.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 08:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dxDiJ7k1d/EQw/+3xa3VqdDqqDNwqcp2y88eT+oJrzU=;
 b=DqupJlAPimigK9Mycms9kXIfcCaRiXtixCCKvt6w6n1kL9Fq/JQ4BqIYjKQV8il2b3
 +OgLqfgrMCe2qJ+E6IDjC1yEj3+tz5UgaChfpdyJTBCsu83US6wr1lvg8Tb53chwiPkE
 kIqtfjdy3Og3p9FYgY0d6Y6OWZZuA3VWKvx+ySYWjgz7xn8SgsHYz1nfmnzai2aatUww
 anzmU2riQ/qtnZ5uZlyu0WpN9gaQ1zVj73E/1SN8rC+Ob0uN/c/XnkPub2HS4nY/GUoR
 hEZpGfnP7ibfNPfl4N4jgdFNS0Soma2Drngp22pryq9VJpTTfDrNu1wdcXBaTZGMWL/t
 XBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dxDiJ7k1d/EQw/+3xa3VqdDqqDNwqcp2y88eT+oJrzU=;
 b=bDngT6J4pcAfwV6Gl8SP8XxVKh3E0TLycyejfWepGt1KpiCG1aO0Jb2WFxyrcR4xLl
 9KajAGjuV5G1nQKFXgNumIvTsVCa/UlBn2cT9k+1kbCGr/4dXTk3dze5KmncVUCIOut9
 vftiabSyPiZXCCbu/SN7FSVuKhtjEGAX2YDc4sxrYTKxVciymt1Dw8KcEHhgb26MixsL
 LmKF6YunctyVgduJVxLkUax8k0kfkUv7OoMcNUuIOA8t1GVcWFY4kaZAaIFukADUePka
 ys8kF6jmMXlgFkxC1iYSdP9qMZH0sqKH25l8OmO+S3zVAJbPOBLCnvEaLx5mP4YKYv/B
 L1vQ==
X-Gm-Message-State: AOAM533AmoaeFgrLJX6L2JbFDOQ/t3xxun9IZKSpz6+y4VzyoCbesuEZ
 aPT1CTH2aWU23C665BLjWEEeIFcYHsnfGbaI8kSUI5El
X-Google-Smtp-Source: ABdhPJx/QvWAWFhjRJAkgI2vmC0cPObkXhOPbcok/+Aoavwl/BqdSVoizX7b9uAq2xnM3MInFueSgmPBeovubtg1A5M=
X-Received: by 2002:a25:cd84:0:b0:628:9d43:8a3c with SMTP id
 d126-20020a25cd84000000b006289d438a3cmr455305ybf.491.1647445667668; Wed, 16
 Mar 2022 08:47:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:13ca:0:0:0:0 with HTTP; Wed, 16 Mar 2022 08:47:47
 -0700 (PDT)
In-Reply-To: <CA+nuEB-fNNSgZKPzWR4Ord2QmCrsnpY9Y7Erzw1RLob+eY9ksw@mail.gmail.com>
References: <CA+nuEB-fNNSgZKPzWR4Ord2QmCrsnpY9Y7Erzw1RLob+eY9ksw@mail.gmail.com>
From: Amol <suratiamol@gmail.com>
Date: Wed, 16 Mar 2022 21:17:47 +0530
Message-ID: <CA+nuEB8aCUrSgLCjnfhij0pW+rjcFA-46S+a6A81LqJFacH42A@mail.gmail.com>
Subject: Re: [ppc/pnv9] clarification on QEMU's dtb
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=suratiamol@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: suratiamol <suratiamol@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies for the formatting.

After a few tests with qemu I found that the dtb written by qemu doesn't
contain the nodes in question. When the VM is run, the dtb is updated
by the runtime firmware, skiboot, which adds those nodes. But the
safe dtb at [2] earlier also must have had skiboot modifying its internal
structure. I will head over to skiboot for now.

Thanks,
Amol

On 16/03/2022, Amol <suratiamol@gmail.com> wrote:
> Hello,
>
> Below is a part of the dtb file as generated by
> qemu's powernv9 emulation:
>
> / {
> 	....
> 	compatible = "qemu,powernv9\0ibm,powernv";
> 	model = "IBM PowerNV (emulated by qemu)";
> 	pciex@600c3c0000000 {
> 		compatible = "ibm,power9-pciex\0ibm,ioda3-phb";
> 		device_type = "pciex";
> 		....
> 		#address-cells = <0x03>;
> 		#size-cells = <0x02>;
> 		#interrupt-cells = <0x01>;
> 		interrupt-parent = <0x804e>;
> 		ranges = <0x2000000 0x00 0x80000000 0x600c0 0x00 0x00 0x7fff0000>;
> 		....
> 		pci@0 {
> 			interrupts = <0x01>;
> 			#address-cells = <0x03>;
> 			#size-cells = <0x02>;
> 			#interrupt-cells = <0x01>;
> 			interrupt-map-mask = <0x00 0x00 0x00 0x07>;
> 			interrupt-map =
> <0x00 0x00 0x00 0x01 0x804e 0xfeff8 0x01
>  0x00 0x00 0x00 0x02 0x804e 0xfeff9 0x01
>  0x00 0x00 0x00 0x03 0x804e 0xfeffa 0x01
>  0x00 0x00 0x00 0x04 0x804e 0xfeffb 0x01>;
> 			ranges = <0x2000000 0x00 0x00 0x2000000 0x00 0x00 0xf0000000 0x00>;
> 		};
> 	};
>

. . .
. . .
. . .

>
> It seems that qemu is generating (or basing its modifications on) an
> incorrectly specified
> dtb.
>
> Thanks,
> Amol
>
> [1] https://elinux.org/Device_Tree_Usage#Advanced_Interrupt_Mapping
> [2] https://people.freebsd.org/~jhibbits/p9_vga_out_devtree.txt
>

