Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CD5FCCBF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 23:07:09 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiiwW-0000NA-2f
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 17:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiirc-0005Vk-VA
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:02:12 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:43680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oiira-0000F6-Vo
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 17:02:04 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-333a4a5d495so215517b3.10
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 14:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ARHubrMRCCtgOqm4QtOEydgDieeCHMHhqUru5w8iCDg=;
 b=gxMj3zneSYux10/2BNDwktyx77vduTHSrp+KIG5LlVsvmSr/9T07V1nQGZH07LRw0E
 mpplEBj83+Vn29RIg7h13SXVuaf5LHAKq0ZtHHV+N8ex9c4SwPBxDIOu1Maap5dpOZpu
 Vs52u5WBoDFnZIz7qzw3hcx87CG8afowXDj5MRHtwlBe8VfhdCE0WmkkMbLrm0miOrHg
 WX41/dxef0iyhWi0dpzHI8gDVJHopRGR6OiCFUVt1+x8H5VBDspeNeCYJ6YH/4B2xLC8
 Zm1FSl+Qy5G2dSAFGss/I8oqgXBTFxtxcaA/bTDKJ55yq/SUT9lQWzEQPuzeNP59TOmP
 lzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ARHubrMRCCtgOqm4QtOEydgDieeCHMHhqUru5w8iCDg=;
 b=iRvYEf2oahW6A6XBRjlNr5i7m+68xUcVUX79bAVGX6lQwf/pTaRpwgj3tj9E9ETCQv
 DRHSNuXSxmAA9+0NP1cl23ummFZ8zXxLZE1Mx0Hv5x22PL912ouKU1Hui+S2Wen8SzSA
 JexZb665PYQt5wxfEZdF0A7NHD2ioNfxiCfVUSUNhugREbxVyqI0k6wsaNVdPPVmPYVr
 fw9HtvBL8qDzJjP1+MuBPwqyOjkDCTFAqDC1uLTGPYkrYduOcDfXZB/FHRixPSia8KgA
 4ThHo1pnEDaKeYeaqzg9YL0y5hqB1Fcq5WbErmf6mt990c5ICohjlNheKjQWQAo/XsCO
 xUmQ==
X-Gm-Message-State: ACrzQf0q+my1oaGHqz2S7GLvla8ZX71seGrnSinLhFZTPE9mMsEfpKRu
 TLWbId3Un5wh/dFvJrqj6F2/fYE7WNOTuyWAMhU=
X-Google-Smtp-Source: AMsMyM5pVGiG7nDOx080er9C/VPKuJanOgD4VLHvif6anZhF87enp2E4VAZfmGN5fcGQ9GN/8G9AS3lyhVPMOTWsz1g=
X-Received: by 2002:a0d:fb45:0:b0:354:cb73:5f81 with SMTP id
 l66-20020a0dfb45000000b00354cb735f81mr28548345ywf.111.1665608521092; Wed, 12
 Oct 2022 14:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221010172813.204597-1-mst@redhat.com>
 <CAJSP0QX9S-VgT9ooinu=BTF6ysrsMOJ29wRJMrDVY5ZbizXTSg@mail.gmail.com>
 <20221012165418-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221012165418-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 12 Oct 2022 17:01:48 -0400
Message-ID: <CAJSP0QW1c+UsAFvnCjNUsNcUvqsn8ZgpRj2nm8MgkmyAyLniZw@mail.gmail.com>
Subject: Re: [PULL 00/55] pc,virtio: features, tests, fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Oct 2022 at 17:00, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Oct 12, 2022 at 04:04:31PM -0400, Stefan Hajnoczi wrote:
> > On Mon, 10 Oct 2022 at 13:46, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:
> > >
> > >   Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > Hi Michael,
> > Please update your .git/config with the https URL for future pull requests:
> >
> >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
> >
> > The pull request is signed with your GPG, so modifications should be
> > detected when verifying the signature. It still seems like a good idea
> > to use https:// when possible instead of unencrypted git://.
> >
> > Stefan
>
> I don't think this is from .git/config, this is just a parameter
> to request-pull. OK, I will switch to that.

You're right. For some reason I thought the URL was pulled from the
remote's configuration in .git/config.

Stefan

