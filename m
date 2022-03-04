Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E451E4CD2B2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:45:46 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5RS-0004y1-0A
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ5Nr-0008EY-OB
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:42:03 -0500
Received: from [2a00:1450:4864:20::531] (port=45852
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nQ5Nq-0003G8-1Z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:42:03 -0500
Received: by mail-ed1-x531.google.com with SMTP id y11so9682556eda.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=rh829fDdnj2cv1EzlLL7bncCuYI0mEnHyTGHBmgxxl8=;
 b=OqpbTMF45klu+vAKs9OHWOjg0hoNq0Z25Sncu+XcE2xkvKzxZTEVsmwxKc1e624gY0
 Hhj3m5yjZY0CaB6EtLT1hIM0gpjYWhbkWHcqSpG9aSAcWTIUl3Ush9itzt1Fcl5fyUrc
 t6TgBaFXef6zv5W4qmHMrpZFB/mtSlg/Wg8RnwuVCKaDw1ogvPAmiCaw3ZLnQKQmjaC1
 Rca6840RZMJErsbiaNBkveXTqsQFZwyb+XH3GTaipwOK9qV+BoiSlFPj9ZPQmpXZ13Si
 wcpx2d6aUJbV4MFd7Ug+ymoZjl2KMRb6A5gwjCa+YjE3YEnLJqi2/rX+65DEAVmcN4xE
 3XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=rh829fDdnj2cv1EzlLL7bncCuYI0mEnHyTGHBmgxxl8=;
 b=CqIvFu9FWLjhn/tTlYzPJR3YilYjMaNbdK/3teFGeDkJEAnWVUQnq1HC+3uMkEVVto
 KRyXVu7Vh3jtCziwVXHTKAAqpEZv9M2yigBGJfYyCxacWXzY8ucU5Ntq30re+EZ1GIMr
 NZZQtPWHKh43XkEcidPsXZ1C7lXTwrloOl0x38kH5eT/9mQywiRyRacOhJXXHS4IljA2
 C5OFc0nnYEoKqkW4j+cbVNVzFVZPgE8Jhm10fnBlBklEUUKkKrudBu89sWkLf5B5r0YV
 Hin8OrWxP38N3y811Cqv6Akj1A7AwSuCpidrJ778lzL1JH6cs+SrXdeNtyAqFmbEhUMp
 blkQ==
X-Gm-Message-State: AOAM530Ids1W1+8nkfg6YpDIddOyc3XX2ZsH04+bdZCvM1+SQUA8To5p
 dKpAjdmO/NkXxLzxEzHM18vmgDKeTmF0jn41wb8x6A==
X-Google-Smtp-Source: ABdhPJyUUd3scdpnpoUbHCIZgsm+ClujoElJYV6ZEt+kk664tBaytwATEOn8JVNAMRPLmAUXV733bqpNSShf4rv3trA=
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr38467179edw.113.1646390518935; Fri, 04
 Mar 2022 02:41:58 -0800 (PST)
MIME-Version: 1.0
References: <CAARzgwyjqEs96QXthDs_yQi_s7qmMsLuH+4YQcq2Hx01_vY3EA@mail.gmail.com>
 <20220303094134.tuhhrvtstxwpksmh@sirius.home.kraxel.org>
 <CAARzgwxFuY=xMQmHU0cocG3ecznhVwQVTF0naaA6wwFkhwvOyA@mail.gmail.com>
 <20220304101846.ct3ge56w6gjq355o@sirius.home.kraxel.org>
In-Reply-To: <20220304101846.ct3ge56w6gjq355o@sirius.home.kraxel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 4 Mar 2022 16:11:47 +0530
Message-ID: <CAARzgwy33DZwoXzMMYCd1e4-88hyzChX-VpHH65P71PW6Ko4Ng@mail.gmail.com>
Subject: Re: any opinion on the patch "[RFC PATCH] hw/i386/e820: remove legacy
 reserved entries for e820"? EOM
To: Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x531.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 3:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Mar 03, 2022 at 03:12:51PM +0530, Ani Sinha wrote:
> > On Thu, Mar 3, 2022 at 15:11 Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > > Sorry, no.  Noticed the discussions but don't remember the details and
> > > didn't took the time to wade through the code to refresh my memory.
> >
> > Could you please take a look when you get time? You have the most context
> > in this space I believe.
>
> Should indeed not be needed unless you use a stone-aged seabios version.
> But I think you can't simply drop it for live migration compatibility
> reasons.  So you'll need do the compatibility dance and drop it for new
> machine types only.  I doubt the benefits outweigh that effort ..

Igor what do you think?

