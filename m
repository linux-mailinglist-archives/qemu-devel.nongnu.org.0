Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6A108ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 14:25:31 +0100 (CET)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZEMs-0003hh-E5
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 08:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iZECz-0004VS-T0
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 08:15:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iZECy-00038c-6H
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 08:15:17 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:33602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iZECw-000376-CN
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 08:15:16 -0500
Received: by mail-io1-xd43.google.com with SMTP id j13so16195722ioe.0
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 05:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VMxrYrQbaNwiH8s95miMrhimRrOm8NjWrl9ixsnkjHw=;
 b=FDHYGTLjOcNu63Rz3dqxy4Fun7UqTGwxPgXjshbS8rO8jtxiXbaXR3iG793B+sRas0
 PKW/1D9B+62XB0HO+Thu3icncIE0HDIYzj93OCdoUh1iVpRxhT5WwVvsMZSoBIdNQraH
 rn6LwQS8RIGLjSYRghdOaXUJJomSrPaZ8nQkkpS1wAoRQRe0Xmnrvob/H6zTChXEfdqY
 bBqGEeUXMI9ZWwbq4CLxljk7zg5lSpC5oY8DwUmA7uj+b5zWvsg1bR0+vXl6RcMgfS50
 w0YJzPNZamrxxlsrcC2atAc3NjgjJDnfIL/LOq5Dy+OsnlPqtOD0pNtrpCNuUy+l8Bpj
 QLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMxrYrQbaNwiH8s95miMrhimRrOm8NjWrl9ixsnkjHw=;
 b=oxhCfhBDC4m3JDhCuJQnTvG21s0LL+qvp3Ba1EXsgLpkLHmxhPOsE4u/YYOJ07vhM/
 FDgxJMCIbkLtGnfPQwsEdDybCpvuB6OZvUFAuUGlSNQ/+xf7b6H7QS+LPvf/bcM5644a
 WtcU64L/ZfTtklU1T2M4w7Cs8BxhRH/MoJQluxE60j6jbCcQCItLll3NL7nBoAYRygiL
 Xp0KAfCNRDj8hGP+0WP4kK96Ta/v9b4R3AHMxzHubUHG98tDpsjfM6MClWSVDV5YDvXa
 SHHnSKM9iJsluALQPxRl9y6pB9HHHJFRJ7WBQRO4H75JQ78pS47u9aq+/1+3W2g1lfob
 bOXQ==
X-Gm-Message-State: APjAAAVEt5ovJ4G/5J7YhzhHq9PR9ZLfol6xSTzek4UNtfv77NI2aPut
 D0ODhF7yIg1biT4V2+aBG4xr2sPD0R4bx7MYMMvF3w==
X-Google-Smtp-Source: APXvYqzPmymzKh2N+YYr6VE9qdTM6WdffC7Xl3ZcGm1MaLZlCN0R4G7yNLiw18r3By/MQ9YT+fykmCXEvH0h+aRooJY=
X-Received: by 2002:a5d:914b:: with SMTP id y11mr7762726ioq.307.1574687712677; 
 Mon, 25 Nov 2019 05:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20191015103900.313928-1-its@irrelevant.dk>
 <20191015103900.313928-14-its@irrelevant.dk>
 <CADSWDzs6mECPKv2qAojEF75Vxi1i5_2fkvDtjWkQU22F9a4a7g@mail.gmail.com>
 <20191120093914.GA1052314@apples.localdomain>
In-Reply-To: <20191120093914.GA1052314@apples.localdomain>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Mon, 25 Nov 2019 13:15:01 +0000
Message-ID: <CADSWDzt9_DtE1NZdTE17vRwZvrcOJdaNKo0X7HG3dgpRc91iMw@mail.gmail.com>
Subject: Re: [PATCH v2 13/20] nvme: refactor prp mapping
To: Klaus Birkelund <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Nov 2019 at 09:39, Klaus Birkelund <its@irrelevant.dk> wrote:
>
> On Tue, Nov 12, 2019 at 03:23:43PM +0000, Beata Michalska wrote:
> > Hi Klaus,
> >
> > On Tue, 15 Oct 2019 at 11:57, Klaus Jensen <its@irrelevant.dk> wrote:
> > >
> > > Instead of handling both QSGs and IOVs in multiple places, simply use
> > > QSGs everywhere by assuming that the request does not involve the
> > > controller memory buffer (CMB). If the request is found to involve the
> > > CMB, convert the QSG to an IOV and issue the I/O. The QSG is converted
> > > to an IOV by the dma helpers anyway, so the CMB path is not unfairly
> > > affected by this simplifying change.
> > >
> >
> > Out of curiosity, in how many cases the SG list will have to
> > be converted to IOV ? Does that justify creating the SG list in vain ?
> >
>
> You got me wondering. Only using QSGs does not really remove much
> complexity, so I readded the direct use of IOVs for the CMB path. There
> is no harm in that.
>
> > > +static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, uint64_t prp1,
> > > +    uint64_t prp2, uint32_t len, NvmeRequest *req)
> > >  {
> > >      hwaddr trans_len = n->page_size - (prp1 % n->page_size);
> > >      trans_len = MIN(len, trans_len);
> > >      int num_prps = (len >> n->page_bits) + 1;
> > > +    uint16_t status = NVME_SUCCESS;
> > > +    bool prp_list_in_cmb = false;
> > > +
> > > +    trace_nvme_map_prp(req->cid, req->cmd.opcode, trans_len, len, prp1, prp2,
> > > +        num_prps);
> > >
> > >      if (unlikely(!prp1)) {
> > >          trace_nvme_err_invalid_prp();
> > >          return NVME_INVALID_FIELD | NVME_DNR;
> > > -    } else if (n->cmbsz && prp1 >= n->ctrl_mem.addr &&
> > > -               prp1 < n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size)) {
> > > -        qsg->nsg = 0;
> > > -        qemu_iovec_init(iov, num_prps);
> > > -        qemu_iovec_add(iov, (void *)&n->cmbuf[prp1 - n->ctrl_mem.addr], trans_len);
> > > -    } else {
> > > -        pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
> > > -        qemu_sglist_add(qsg, prp1, trans_len);
> > >      }
> > > +
> > > +    if (nvme_addr_is_cmb(n, prp1)) {
> > > +        req->is_cmb = true;
> > > +    }
> > > +
> > This seems to be used here and within read/write functions which are calling
> > this one. Maybe there is a nicer way to track that instead of passing
> > the request
> > from multiple places ?
> >
>
> Hmm. Whether or not the command reads/writes from the CMB is really only
> something you can determine by looking at the PRPs (which is done in
> nvme_map_prp), so I think this is the right way to track it. Or do you
> have something else in mind?
>

I think what I mean is that is seems that this variable is being used only in
functions that call map_prp directly, but in order to set that variable within
the req structure this needs to be passed along from the top level of command
submission instead of maybe having additional  param to map_prpr to set it to be
CMB command or not. If that makes sense.

BR
Beata
> > > +    pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
> > > +    qemu_sglist_add(qsg, prp1, trans_len);
> > > +
> > >      len -= trans_len;
> > >      if (len) {
> > >          if (unlikely(!prp2)) {
> > >              trace_nvme_err_invalid_prp2_missing();
> > > +            status = NVME_INVALID_FIELD | NVME_DNR;
> > >              goto unmap;
> > >          }
> > > +
> > >          if (len > n->page_size) {
> > >              uint64_t prp_list[n->max_prp_ents];
> > >              uint32_t nents, prp_trans;
> > >              int i = 0;
> > >
> > > +            if (nvme_addr_is_cmb(n, prp2)) {
> > > +                prp_list_in_cmb = true;
> > > +            }
> > > +
> > >              nents = (len + n->page_size - 1) >> n->page_bits;
> > >              prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
> > > -            nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
> > > +            nvme_addr_read(n, prp2, (void *) prp_list, prp_trans);
> > >              while (len != 0) {
> > > +                bool addr_is_cmb;
> > >                  uint64_t prp_ent = le64_to_cpu(prp_list[i]);
> > >
> > >                  if (i == n->max_prp_ents - 1 && len > n->page_size) {
> > >                      if (unlikely(!prp_ent || prp_ent & (n->page_size - 1))) {
> > >                          trace_nvme_err_invalid_prplist_ent(prp_ent);
> > > +                        status = NVME_INVALID_FIELD | NVME_DNR;
> > > +                        goto unmap;
> > > +                    }
> > > +
> > > +                    addr_is_cmb = nvme_addr_is_cmb(n, prp_ent);
> > > +                    if ((prp_list_in_cmb && !addr_is_cmb) ||
> > > +                        (!prp_list_in_cmb && addr_is_cmb)) {
> >
> > Minor: Same condition (based on different vars) is being used in
> > multiple places. Might be worth to move it outside and just pass in
> > the needed values.
> >
>
> I'm really not sure what I was smoking when writing those conditions.
> It's just `var != nvme_addr_is_cmb(n, prp_ent)`. I fixed that. No need
> to pull it out I think.
>
> > >  static uint16_t nvme_dma_write_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> > > -                                   uint64_t prp1, uint64_t prp2)
> > > +    uint64_t prp1, uint64_t prp2, NvmeRequest *req)
> > >  {
> > >      QEMUSGList qsg;
> > > -    QEMUIOVector iov;
> > >      uint16_t status = NVME_SUCCESS;
> > >
> > > -    if (nvme_map_prp(&qsg, &iov, prp1, prp2, len, n)) {
> > > -        return NVME_INVALID_FIELD | NVME_DNR;
> > > +    status = nvme_map_prp(n, &qsg, prp1, prp2, len, req);
> > > +    if (status) {
> > > +        return status;
> > >      }
> > > -    if (qsg.nsg > 0) {
> > > -        if (dma_buf_write(ptr, len, &qsg)) {
> > > -            status = NVME_INVALID_FIELD | NVME_DNR;
> > > -        }
> > > -        qemu_sglist_destroy(&qsg);
> > > -    } else {
> > > -        if (qemu_iovec_to_buf(&iov, 0, ptr, len) != len) {
> > > +
> > > +    if (req->is_cmb) {
> > > +        QEMUIOVector iov;
> > > +
> > > +        qemu_iovec_init(&iov, qsg.nsg);
> > > +        dma_to_cmb(n, &qsg, &iov);
> > > +
> > > +        if (unlikely(qemu_iovec_to_buf(&iov, 0, ptr, len) != len)) {
> > > +            trace_nvme_err_invalid_dma();
> > >              status = NVME_INVALID_FIELD | NVME_DNR;
> > >          }
> > > +
> > >          qemu_iovec_destroy(&iov);
> > > +
> > Aren't we missing the sglist cleanup here ?
> > (goto as in nvme_dma_read_prp)
> >
> > Aside: both nvme_write_prp and nvme_read_prp seem to differ only
> > with the final call to either dma or qemu_ioves calls.
> > Might be worth to unify it and move it to a single function with additional
> > parameter that will determine the type of the transaction.
> >
>
> True. I have combined them into a single nvme_dma_prp function.
>
> > > +static void nvme_init_req(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> > > +{
> > > +    memset(&req->cqe, 0, sizeof(req->cqe));
> > > +    req->cqe.cid = cmd->cid;
> > > +    req->cid = le16_to_cpu(cmd->cid);
> > > +
> > > +    memcpy(&req->cmd, cmd, sizeof(NvmeCmd));
> > > +    req->status = NVME_SUCCESS;
> > > +    req->is_cmb = false;
> > > +    req->is_write = false;
> >
> > What is the use case for this one ?
> > It does not seem to be referenced in this patch.
> >
>
> That crept in there by mistake. I have removed it.

