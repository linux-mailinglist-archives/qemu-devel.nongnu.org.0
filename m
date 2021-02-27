Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F69326AEB
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 02:03:14 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFo0n-0004WC-0n
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 20:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lFnzW-00042h-Tv; Fri, 26 Feb 2021 20:01:54 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lFnzT-00008I-CQ; Fri, 26 Feb 2021 20:01:54 -0500
Received: by mail-pl1-x633.google.com with SMTP id g20so6201720plo.2;
 Fri, 26 Feb 2021 17:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YymxZiI5kmYFmQq5ownkoJaevU2WhlYQxFrxNT/xNpo=;
 b=RgwgyP8tSo2FSz6XNJQEzLYtNti7b42xsqSU6eRhN2vusjFtivpdk+dDeSP27PLgbk
 84JFoRX+kR1eU8Q739vVZsyBXfczEnwjSIimTuItgokQQlBMc/0MHNhsXiB2uqnY+qT/
 kUZ+EXzbad6X0+ui45MjcfpVKJiBzmtlnxVSG35U19v38kQpYLOhPQFnDZ+jQ/T8vmtw
 8pIH3gle7BOhSxUnZXpOBck/G4gccqhwKAhiNC1n2U/7Qnohanp7gTZCA3NTs3P5kMI4
 kfZjlY63qePYcYg+LLSG4IQN9LwH2LZohLr3IIWZ+BicGKjLFym/0hyXuaCBsGnyYfKD
 1vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YymxZiI5kmYFmQq5ownkoJaevU2WhlYQxFrxNT/xNpo=;
 b=N09mcB2zcoYbDVm8kyF/2f3hWo4vPFsUaxjwdj6Ld6GajclLwxMGEJjpN5sHFq28Oo
 CVRYlUgZ2GBTJpWf7Snf5bsLv57CPiNReI/wA5XJol49tC8wrTStbziqMJbayVfprtPs
 n5X+WFf9uB49rwNxK8+ayfWAMEJhhgVWx0XZK2c4K8by9zbaw6AyTUWIs0BWuHZu8hat
 UNpZv5AbPGMusTnCQX12JRAqDX4sFmyVAyefvSBYHKuVjE66I3WyG5mlmEL5xqAdtSVX
 B6bmca2eyYZugAaUoIXVUuSqgAQ/SYOWkEAgJRLxYSFMWkPZSYoGJB786C+k7OhyqPv/
 UAlQ==
X-Gm-Message-State: AOAM531op1WPYoMC8iJ/r1u5yhix4Zvr2s0AnoC66wXemX3LHgRv7Igu
 Y1qEtKzC8WPG7lotniFAq0Y=
X-Google-Smtp-Source: ABdhPJyJjF6npo0VcJK/jigoxnkcyaIuN0OinhrXUqnjBh70qw6zhJ4IEmPXKLT67oadotcqTdn82w==
X-Received: by 2002:a17:90a:5b0c:: with SMTP id
 o12mr6120018pji.68.1614387708455; 
 Fri, 26 Feb 2021 17:01:48 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c18sm9191554pgm.88.2021.02.26.17.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 17:01:48 -0800 (PST)
Date: Sat, 27 Feb 2021 10:01:45 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V2 6/7] hw/block/nvme: support namespace attachment command
Message-ID: <20210227010145.GA3670@localhost.localdomain>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
 <20210210160937.1100-7-minwoo.im.dev@gmail.com>
 <20210226175935.GB3949@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210226175935.GB3949@redsun51.ssa.fujisawa.hgst.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x633.google.com
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

On 21-02-27 02:59:35, Keith Busch wrote:
> On Thu, Feb 11, 2021 at 01:09:36AM +0900, Minwoo Im wrote:
> > @@ -183,6 +183,7 @@ static const uint32_t nvme_cse_acs[256] = {
> >      [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
> >      [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
> >      [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
> > +    [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP,
> 
> Missing NVME_CMD_EFF_NIC for the attachment command.

Will do that!

> >  };
> >  
> >  static const uint32_t nvme_cse_iocs_none[256];
> > @@ -3766,6 +3767,62 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
> >      return NVME_NO_COMPLETE;
> >  }
> >  
> > +static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
> > +static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> > +{
> > +    NvmeNamespace *ns;
> > +    NvmeCtrl *ctrl;
> > +    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
> > +    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
> > +    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
> > +    bool attach = !(dw10 & 0xf);
> > +    uint16_t *nr_ids = &list[0];
> > +    uint16_t *ids = &list[1];
> > +    uint16_t ret;
> > +    int i;
> > +
> > +    trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
> > +
> > +    ns = nvme_subsys_ns(n->subsys, nsid);
> > +    if (!ns) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    ret = nvme_dma(n, (uint8_t *)list, 4096,
> > +                   DMA_DIRECTION_TO_DEVICE, req);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    if (!*nr_ids) {
> > +        return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
> > +    }
> > +
> > +    for (i = 0; i < *nr_ids; i++) {
> > +        ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
> > +        if (!ctrl) {
> > +            return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
> > +        }
> > +
> > +        if (attach) {
> > +            if (nvme_ns_is_attached(ctrl, ns)) {
> > +                return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
> > +            }
> > +
> > +            nvme_ns_attach(ctrl, ns);
> > +            __nvme_select_ns_iocs(ctrl, ns);
> > +        } else {
> > +            if (!nvme_ns_is_attached(ctrl, ns)) {
> > +                return NVME_NS_NOT_ATTACHED | NVME_DNR;
> > +            }
> > +
> > +            nvme_ns_detach(ctrl, ns);
> > +        }
> > +    }
> > +
> > +    return NVME_SUCCESS;
> > +}
> 
> Every controller that has newly attached the namespace needs to emit the
> Namespace Notify AER in order for the host to react correctly to the
> command.

Okay. will prepare next series.

Thanks!

