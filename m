Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B53297D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:28:22 +0100 (CET)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1KE-0001ib-U1
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH1In-0001EG-K4; Tue, 02 Mar 2021 04:26:49 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH1Il-0004uP-O3; Tue, 02 Mar 2021 04:26:49 -0500
Received: by mail-pf1-x431.google.com with SMTP id j12so13413851pfj.12;
 Tue, 02 Mar 2021 01:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qp+KDwencUndb3Wg3Bz8b61OhMURPyDzZl7GOE1I93w=;
 b=bVJd/qSVMJaKlc21vN479UJvlYaiwJsJy4LX0zs5gF8+4eg/32sBASmytrEIOEpd80
 xHE+6QfeQrfPo8q+5pgOLGjRnxYsfuj5IJycRga1EQ/6npZbXAiysQZ2RuE0hynZ/2dU
 DGFz8iZHxxilKNSfyuA0WDmVFkV2t91Fr+4K9PP2XTVTP32WbjS2GkI3YwIvC2T8nvAS
 itk0HuToMzGIJjMsp/niWqxlHtZR48IBEDA93Pj+yl6Axt4fT1gRMZOjaPlL20Ui5NIE
 NnzujIdiTfIwuQ8abPsj6Fv5lM28F3IXmto6/tNasPj1PxfA+nOFUVBFOy3+IsxwiWHl
 OjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qp+KDwencUndb3Wg3Bz8b61OhMURPyDzZl7GOE1I93w=;
 b=IGgm0OUpiUhReUcq8EqwYlPY/lRcsiVChwMAoSA8DOvHijIh/Ypdvt0D5BdYOiQC60
 B+0R4pv+dp1/aFBVfIZBvVHFNtcdvvb7EcoCynKYzxhx+KSnJ1EklPCnddtZR+pZl23C
 sKeZdrI2pQkVLhBARDfhE7/YV8YtHL/ewk2+m9qhPSky8V4HZ01vJ3ZG+dHubPKhK1Sq
 VcVIAEeNr0SLZSgUbPwCglrZ53836UkhzIKW65H0hv9M4iVar9+0QF2D4KjMifnJZi7r
 73CRHdwD0S1VetsudsJTVBSpbbEDKUD6BpjbnTZUGBRpjW9LASeewxPvwOw1KdIqMZ7J
 aWfA==
X-Gm-Message-State: AOAM532RGhXhMhcVG1eHCYvWsqB80oMqV0u8IdUsyj1caaefKANdIs7F
 1zldPGx9uzyCkR7LZbsZTSI=
X-Google-Smtp-Source: ABdhPJxLl8TcxytFLn/Kh8QLD1DXSfxiSWv1eOSGW+Pp6jHSyKehqIxQtSgXsJx/xJhRmQpj1l28ew==
X-Received: by 2002:a65:690a:: with SMTP id s10mr16991743pgq.162.1614677205549; 
 Tue, 02 Mar 2021 01:26:45 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id b187sm18285875pgc.23.2021.03.02.01.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 01:26:45 -0800 (PST)
Date: Tue, 2 Mar 2021 18:26:43 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH V3 7/8] hw/block/nvme: support changed namespace
 asyncrohous event
Message-ID: <20210302092643.GA2136@localhost.localdomain>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
 <20210228161100.54015-8-minwoo.im.dev@gmail.com>
 <YDyB8m//9Mh3whCI@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YDyB8m//9Mh3whCI@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x431.google.com
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

On 21-03-01 06:56:02, Klaus Jensen wrote:
> On Mar  1 01:10, Minwoo Im wrote:
> > If namespace inventory is changed due to some reasons (e.g., namespace
> > attachment/detachment), controller can send out event notifier to the
> > host to manage namespaces.
> > 
> > This patch sends out the AEN to the host after either attach or detach
> > namespaces from controllers.  To support clear of the event from the
> > controller, this patch also implemented Get Log Page command for Changed
> > Namespace List log type.  To return namespace id list through the
> > command, when namespace inventory is updated, id is added to the
> > per-controller list (changed_ns_list).
> > 
> > To indicate the support of this async event, this patch set
> > OAES(Optional Asynchronous Events Supported) in Identify Controller data
> > structure.
> > 
> > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > ---
> >  hw/block/nvme.c      | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >  hw/block/nvme.h      |  7 +++++++
> >  include/block/nvme.h |  7 +++++++
> >  3 files changed, 58 insertions(+)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 68c2e63d9412..fc06f806e58e 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -2980,6 +2980,32 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
> >                      DMA_DIRECTION_FROM_DEVICE, req);
> >  }
> >  
> > +static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
> > +                                    uint64_t off, NvmeRequest *req)
> > +{
> > +    uint32_t nslist[1024];
> > +    uint32_t trans_len;
> > +    NvmeChangedNs *ns, *next;
> > +    int i = 0;
> > +
> > +    memset(nslist, 0x0, sizeof(nslist));
> > +    trans_len = MIN(sizeof(nslist) - off, buf_len);
> > +
> > +    QTAILQ_FOREACH_SAFE(ns, &n->changed_ns_list, entry, next) {
> > +        nslist[i++] = ns->nsid;
> > +
> > +        QTAILQ_REMOVE(&n->changed_ns_list, ns, entry);
> > +        g_free(ns);
> > +    }
> > +
> > +    if (!rae) {
> > +        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
> > +    }
> > +
> > +    return nvme_dma(n, ((uint8_t *)nslist) + off, trans_len,
> > +                    DMA_DIRECTION_FROM_DEVICE, req);
> > +}
> > +
> >  static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
> >                                   uint64_t off, NvmeRequest *req)
> >  {
> > @@ -3064,6 +3090,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
> >          return nvme_smart_info(n, rae, len, off, req);
> >      case NVME_LOG_FW_SLOT_INFO:
> >          return nvme_fw_log_info(n, len, off, req);
> > +    case NVME_LOG_CHANGED_NSLIST:
> > +        return nvme_changed_nslist(n, rae, len, off, req);
> >      case NVME_LOG_CMD_EFFECTS:
> >          return nvme_cmd_effects(n, csi, len, off, req);
> >      default:
> > @@ -3882,6 +3910,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> >      uint16_t *ids = &list[1];
> >      uint16_t ret;
> >      int i;
> > +    NvmeChangedNs *changed_nsid;
> >  
> >      trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
> >  
> > @@ -3920,6 +3949,18 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> >  
> >              nvme_ns_detach(ctrl, ns);
> >          }
> > +
> > +        /*
> > +         * Add namespace id to the changed namespace id list for event clearing
> > +         * via Get Log Page command.
> > +         */
> > +        changed_nsid = g_new(NvmeChangedNs, 1);
> > +        changed_nsid->nsid = nsid;
> > +        QTAILQ_INSERT_TAIL(&ctrl->changed_ns_list, changed_nsid, entry);
> > +
> > +        nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
> > +                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
> > +                           NVME_LOG_CHANGED_NSLIST);
> >      }
> 
> If one just keeps attaching/detaching we end up with more than 1024
> entries here and go out of bounds in nvme_changed_nslist.
> 
> How about having the QTAILQ_ENTRY directly on the NvmeNamespace struct
> and use QTAILQ_IN_USE to check if the namespace is already in the list?

QTAILQ_IN_USE might be tough to represent relationship between
controller and namespace itself.  So, I will work on this with standard
bitmap rather than the list.  I think bitmap will be easier to represent
the relationship.

