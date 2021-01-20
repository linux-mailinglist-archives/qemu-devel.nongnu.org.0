Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A42FC609
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 01:46:10 +0100 (CET)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l21dR-0000tt-Gi
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 19:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l21bk-0000GH-5p; Tue, 19 Jan 2021 19:44:24 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l21bi-0005nw-E4; Tue, 19 Jan 2021 19:44:23 -0500
Received: by mail-pf1-x434.google.com with SMTP id q20so13418287pfu.8;
 Tue, 19 Jan 2021 16:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AoGkuMPg14/lsBcTol3sSswYmKiQxWDRs38aqAY5Px8=;
 b=PLGlRorC4ftvFsoGxSFVzVIF0/xn2gKvVrH3jUv87+TGAjNhWueTcItpdXtXZKHXUX
 iYx3rlm0bcYWQl7IriK/28Bvv1eWpPNrPKHxTULD7Hn373sG+2JzB3ykTOwzILs/JDNy
 XvMdZTusiDaoCePS3ExMltXFF+JmPRiEpO9WPJUOlEeaNNIJIzu1lY9CEhezoyMiPAHz
 a/rY1QgGPEfIBW21WHuJy7cSjm2V2/9u6P0SZ8YWvaLfbH1IBpL6kwyktkTMJP55kKZv
 YyikmQG+wnsg91y+776PsJvkuLlWFSyptI60m1aJ44rTPDWhjLDfdNkNRL8oiRcpyVGt
 nISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AoGkuMPg14/lsBcTol3sSswYmKiQxWDRs38aqAY5Px8=;
 b=EDpt366ALCrUXwsk2FnIqhBqdtIdy907s5l7Z/bfTysbq60xsvKmNaQpVua4wRSWwU
 V5KXqjLm1Pt/gOf48o7cb4Vvsl4/Bjz+T5j2vIzuXGuTexTfIGaTh9VBQuZifndMolfK
 Gr7XNhc5WucHu/R+q1zCUkUUaBEbrS1dzwHAPa+bi/3BPm7tTDEf5HhKlD3kpt3o25yr
 8iOhYYiEGG2TWXDhjf7JU6REO+GKRDmQD4ix5QtYHNfLfWwOzx5O2Y7VCFa7glfFZJt/
 ZyxcuzEpu1RngjgLd/MBrWbu5OYGkr4d1XxqB6VeAs4a7IJ6kZNg45W6RXiu+UKwDrKf
 CzWA==
X-Gm-Message-State: AOAM533vl8HvgOPSSWRPFTl6pySeVoluvqo3gBhPS9Q33BlFick6ER//
 zlAJUDpWiMgVnn2kZHtVS+w=
X-Google-Smtp-Source: ABdhPJy2R0M0CE4alS88OwlhPznm7U4Ly9PRwTZRfZYQnvyezfu0vFW5nPcZZ3LYELPJOT27LiGCGQ==
X-Received: by 2002:a63:3049:: with SMTP id w70mr6794299pgw.224.1611103460495; 
 Tue, 19 Jan 2021 16:44:20 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id o14sm151131pjf.12.2021.01.19.16.44.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Jan 2021 16:44:19 -0800 (PST)
Date: Wed, 20 Jan 2021 09:44:17 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210120004417.GA4205@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <YAciaPBu9TuGjifu@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAciaPBu9TuGjifu@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-19 19:18:16, Klaus Jensen wrote:
> On Jan 20 02:01, Minwoo Im wrote:
> > Hello,
> > 
> > This patch series is third one to support multi-controller and namespace
> > sharing in multi-path.  This series introduced subsystem scheme to
> > manage controller(s) and namespace(s) in the subsystem.
> > 
> > This series has new patches from the V2:  'detached' parameter has been
> > added to the nvme-ns device.  This will decide whether to attach the
> > namespace to controller(s) in the current subsystem or not.  If it's
> > given with true, then it will be just allocated in the subsystem, but
> > not attaching to any controllers in the subsystem.  Otherwise, it will
> > automatically attach to all the controllers in the subsystem.  The other
> > t hing is that the last patch implemented Identify Active Namespace ID
> > List command handler apart from the Allocated Namespace ID List.
> > 
> > Run with:
> >   -device nvme,serial=qux,id=nvme3
> >   -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3
> > 
> >   -device nvme-subsys,id=subsys0
> >   -device nvme,serial=foo,id=nvme0,subsys=subsys0
> >   -device nvme,serial=bar,id=nvme1,subsys=subsys0
> >   -device nvme,serial=baz,id=nvme2,subsys=subsys0
> >   -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0,detached=true
> >   -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2
> > 
> > nvme-cli:
> >   root@vm:~/work# nvme list -v                                                                                                      
> >   NVM Express Subsystems                                                                                                 
> >                                                                                                                                      
> >   Subsystem        Subsystem-NQN                                                                                    Controllers
> >   ---------------- ------------------------------------------------------------------------------------------------ ----------------
> >   nvme-subsys0     nqn.2019-08.org.qemu:qux                                                                         nvme0
> >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme1, nvme2, nvme3
> >                                                                                                                                    
> >   NVM Express Controllers                                                                                           
> >                                                                                                                   
> >   Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
> >   -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
> >   nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0
> 
> Shouldn't nvme0n1 be listed under Namespaces for nvme0?

Oh, I missed that one from the output.  As Keith mentioned, I ran the
list command again based on the latest nvme-cli.git:

Please refer the following result.  I think it's okay not to send the
cover letter again :)

# nvme --version
nvme version 1.13.48.g33c6

# nvme list -v
NVM Express Subsystems

Subsystem        Subsystem-NQN                                                                                    Controllers
---------------- ------------------------------------------------------------------------------------------------ ----------------
nvme-subsys0     nqn.2019-08.org.qemu:qux                                                                         nvme0
nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme1, nvme2, nvme3

NVM Express Controllers

Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces      
-------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
nvme0    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys0 nvme0n1
nvme1    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 
nvme2    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 
nvme3    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys1 nvme1c3n1

NVM Express Namespaces

Device       NSID     Usage                      Format           Controllers     
------------ -------- -------------------------- ---------------- ----------------
nvme0n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme0
nvme1n1      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme3

