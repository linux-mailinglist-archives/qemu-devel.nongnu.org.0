Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678A6B4E8E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagc6-0008KN-GB; Fri, 10 Mar 2023 12:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pagbz-0008Jl-UR
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:33:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pagby-0005SZ-4T
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:32:59 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so9787413pjb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678469576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a2wmv/MrwvmL+DNROigPYlU+RA7OVJctF/3GDEt8Csw=;
 b=JmIgw4PCUnDAo57dbxNULD+nVpcaJEYTLx82NJXFaXGmWEq8g+LbzrdAYm4tsDOkY0
 q9BFd9M02axK24MrTFyhUj74NFcvhWDEaKEuA46WkJDGzqC/5241oK/6hcJ5y04R8Av9
 SplwawkUSwPkdXGsiJ0ifOGL5rITFrRlkQm+SBbJxMG6Mqg66uJ5Lm9gIBdco3fpqUjP
 M9xL5aJdQYpiotUFBcyUw5vUl26AYikbe6d5NwEpeW3NJSW0t77AQsLQ83x4NMuuTAQz
 jJloujAOuqAAXLVnApaNuwaY9/wAj7b7kWgJS0GulS/M/iHxXdbTaEc+qk6dl9WFVepU
 PLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678469576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a2wmv/MrwvmL+DNROigPYlU+RA7OVJctF/3GDEt8Csw=;
 b=EPRU5lQN2oxs5IlT257/KIgmgRjI1HMYEBRJFxxNPLob6Aj6iST7q9v1ZI0esjI7eI
 FGtgPzeVoUl4xiQxQgGvBQzD5fb2/MKSzOT5HJvaH9/6yJDVkM8LDmXE3LVad9jZWcLH
 G8kJk0lVwr2c3v6MGTNyEcRlUu5Glh19A/JsAWSSGBCp+yMatU3OljIXuKRLFeLbgRyw
 So5+4SgzLalDbVxbXXEQCpX+0/2wBY+TyVDU/AAa3FHVRV4345XY78ykqk0192B1UUlG
 DuIZ67UBI/zH8l+AH1Wu52fhjHgTjrdR8gjK7c+Fwdmkikevaj+1ejlz5IxortI4ycxG
 hU9A==
X-Gm-Message-State: AO0yUKWPjCxgmEsOh8b/lddlLCWG8SCLhn3dLOWi9mJnSoP1XyYF3yiA
 p24+oizQpTGEfnoT7Rc1h5D4cj2STTxEgk8QUVyU/A==
X-Google-Smtp-Source: AK7set9vD0qdXkWEoewMpIClhyR5uvQlSBibJoliPftGhUPtr9lDE/EezUNz7USFsodHY6J+iJOB4vLnjgwIRqunUXI=
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr10480705plb.13.1678469576006; Fri, 10
 Mar 2023 09:32:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678237635.git.mst@redhat.com>
 <20230309094647-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230309094647-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 17:32:44 +0000
Message-ID: <CAFEAcA-pO1OYwO8PZwSjFiLX=MJcK+cYqtFqaF3ZZtTGdZ_EXw@mail.gmail.com>
Subject: Re: [PULL 00/73] virtio,pc,pci: features, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 9 Mar 2023 at 14:47, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 07, 2023 at 08:10:51PM -0500, Michael S. Tsirkin wrote:
> > The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
> >
> >   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 52062b213c13bd7fff966d36b554c04609c925d6:
> >
> >   virtio: refresh vring region cache after updating a virtqueue size (2023-03-07 19:51:07 -0500)
>
>
> I moved it one commit back, now at (96cb085897)
> Cornelia posted some concerns about the last commit.
>
> > ----------------------------------------------------------------
> > virtio,pc,pci: features, fixes
> >
> > Several features that landed at the last possible moment:
> >
> > Passthrough HDM decoder emulation
> > Refactor cryptodev
> > RAS error emulation and injection
> > acpi-index support on non-hotpluggable slots
> > Dynamically switch to vhost shadow virtqueues at vdpa net migration
> >
> > Plus a couple of bugfixes that look important to have in the release.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

