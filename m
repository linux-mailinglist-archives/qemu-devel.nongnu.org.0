Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAD82FF903
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 00:43:18 +0100 (CET)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2jbh-0005By-S9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 18:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2jaS-00047s-6I; Thu, 21 Jan 2021 18:42:00 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2jaQ-0006v5-I3; Thu, 21 Jan 2021 18:41:59 -0500
Received: by mail-pj1-x1035.google.com with SMTP id e6so2700922pjj.1;
 Thu, 21 Jan 2021 15:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/IH8vCQ8oxIMBSVP4SRv+n7yf37grX4x4L6pXeKpxaw=;
 b=UIMIb+W3AO5UoS+umhzFybfurq6MA56IrvBhlUNB+20Wuq5tlURyCdeFpAmR6Uz2IY
 JLTjmoBGT9+GGS6ikdKW2azFAGEOWjP9AV5UvDJBSSEGB67+fKgzwtoF0DCyWg3srYlr
 91C/oBU+XBuEFScULFHCNXwRbcVXRguzSHtj4a9o884mNFwyqXWIQIQV9k2ZgfzDRYaJ
 Q9hBomIEnuoUWouceZkuDQvg2Fyx2J252Ttjl2YWhg+Jycdqt0n6G0t1LS3pzbOMsiLQ
 pq8XD58eV/vH5ZyWMOO1LzycC8RA2FjGmplUvSpOfe6V3jJNEzFjswgPCWi8wMpCWV8a
 DLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/IH8vCQ8oxIMBSVP4SRv+n7yf37grX4x4L6pXeKpxaw=;
 b=Y3hw2eRMn7stDKazhWUH6SNJELvEwY8ioUd/FZMb4A66WTatKazTBIJG0fd/2PDm9t
 t8xjsxVCx8PP6LgQNvglMRKY8zpiJaIJ5/29yXvNki/l3sJ1AKTu9ACeRhW3dnj31CLb
 2l3iNtNHoy/w0VyUp+KDEp1OV5RkkqZLqAFl0nI4Zo5FrhAvLjqmOO58UHLReNCVpxPk
 WgrQHIgCW7mWlHZ7dzNI3Git4bgSnVBsdjXCB0UEfS/0fhPdTB1Yl9DOCfYsdVn0ZUa+
 siCpa6Ja4I1+dxsRDxkS2TXUf7zoCc06i0vH0yRJe7o+dOXIXeB5kzXDgn0N3DbMUX7X
 43Sw==
X-Gm-Message-State: AOAM533frnrGQHpK4Klu0eGm5Cdkv8/4+FSRbOBUTM4BpHR+EB5cyteQ
 WSvGWZPipldD8DFkdXtxYkM=
X-Google-Smtp-Source: ABdhPJzoXNbreqCOEgNBXGxA0qc2RA2+JpfkYq/oiPyxmD+GBoANrj4UNsE8+Ey33yW74zL0R0LLOw==
X-Received: by 2002:a17:90a:4606:: with SMTP id
 w6mr2039686pjg.172.1611272516524; 
 Thu, 21 Jan 2021 15:41:56 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k4sm6460040pfk.44.2021.01.21.15.41.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jan 2021 15:41:56 -0800 (PST)
Date: Fri, 22 Jan 2021 08:41:53 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V4 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210121234153.GC2746@localhost.localdomain>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
 <20210121220908.14247-5-minwoo.im.dev@gmail.com>
 <20210121231716.GD1727271@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210121231716.GD1727271@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-21 15:17:16, Keith Busch wrote:
> On Fri, Jan 22, 2021 at 07:09:06AM +0900, Minwoo Im wrote:
> > -static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> > +static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t cntlid)
> >  {
> >      NvmeIdCtrl *id = &n->id_ctrl;
> >      uint8_t *pci_conf = pci_dev->config;
> >  
> > +    n->cntlid = cntlid;
> 
> I don't think 'cntlid' is important enough to be a function parameter.
> You can just set it within the 'NvmeCtrl' struct before calling this
> function like all the other properties.

Okay.  Rather than adding a parameter to this function,
nvme_init_subsys() may take this job to assign cntlid to the controller
instance first.  Let me fix one!

> > @@ -4517,7 +4543,11 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> >          return;
> >      }
> >  
> > -    nvme_init_ctrl(n, pci_dev);
> > +    cntlid = nvme_init_subsys(n, errp);
> > +    if (cntlid < 0) {
> 
>     error_propogate();

Thanks for catching this.

