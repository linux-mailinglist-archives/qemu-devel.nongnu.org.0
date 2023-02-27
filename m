Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645676A39F0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 05:03:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWUit-0006hN-79; Sun, 26 Feb 2023 23:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pWUiq-0006cS-LB
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 23:02:44 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pWUio-0008Fc-PH
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 23:02:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id i3so5393898plg.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 20:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bj8YZUQqoH/wWKUG9cBIsXQII/f2NzHsSWeQQ89UJuI=;
 b=DY9a4c2PXSv8U+mpCpoplo1vO+PVcr+M6R+JN74H27ecj37fHUEcsmsykvLvnhZhcp
 nRJD4mGj4b8H/unsRQ6Bd920dLTuOFtAo15VS8Ug1OmhQxfWENLnB85xNrLiyymhFjx9
 jF5fGm6GQL8VRj62Cyfz+ia7y4KZmmvcOaOiFJj5nAvPz5OmM1ZDmDFV/IcuAmvyazRT
 0Gv5g3P0SyVtaN+PdM3pr73dcGnUfhmfePJ5B9dE7Oc85MmN8XldpIG1fcgkjkGZCen/
 faGj2QC4TyjRIz67G2ynwDjacc8ic1Ql4YZorvsf2sBO1pRuRcM8bvMY4bEkvYxxOpPg
 7aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bj8YZUQqoH/wWKUG9cBIsXQII/f2NzHsSWeQQ89UJuI=;
 b=qRZ6WJG50o0iuHXgO12mUC5nkJdSk/5V4kMFqeXkp1ML/A5KqIo+dKq74dcVJSQCKT
 RC4ERcJJN3P1vowVmKFZa9qm/Bu4Bjini4lqpFjT11iTWNF8v+quDs7ejhG0iRPYW3rb
 Aoye0DUZjmgnjlt/MHvJjB30CfR83gAbs5l1ct8UerRAaDvog00+OtsamXfTIsbMoz+U
 BVRB9/D7f+NSBoeU3gFLuBYwEoqrGRRVke6e6D91muE+3GK4VfadoGuNoSx01HQ7sdEV
 Dd30dtfoL8ISHi/fkTSwptl9NV7WOwh3nTnQs5S7pi0Q3YKTq2+ad34kzDdIxmGTjgeB
 VkUw==
X-Gm-Message-State: AO0yUKWJPDuH5wxdcO7Ntgg3xNTDpada1oJ+KtbSc1sVIzWzwFNyhbgQ
 MYOMgMZDdLfQ8jqnArMCIczP+qabshBl5n0RV8rhGQ==
X-Google-Smtp-Source: AK7set/YbXdgbyDV3CPxvnE9LSPeueRYvPtdTWK1C6Rb5KMR3IHqbRnoS0i0+cPdWwP5fh/D9hmpWaxSNvT1IsE65wU=
X-Received: by 2002:a17:902:ea01:b0:19a:7f9c:66e3 with SMTP id
 s1-20020a170902ea0100b0019a7f9c66e3mr3902730plg.5.1677470560925; Sun, 26 Feb
 2023 20:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
In-Reply-To: <Y/NCQhGmqIadlw0y@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 27 Feb 2023 05:45:32 +0200
Message-ID: <CABcq3pF9M1=e21WwLTZSjcST1WZnJMHwYN_r_KrvPgv1OWUc9Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=andrew@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi all,

On Mon, Feb 20, 2023 at 11:50 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
> > Added a function to check the stamp in the helper.
> > eBPF helper should have a special symbol that generates during the buil=
d.
> > QEMU checks the helper and determines that it fits, so the helper
> > will produce proper output.
>
> I think this is quite limiting for in place upgrades.
>
> Consider this scenario
>
>  * Host has QEMU 8.1.0 installed
>  * VM is running QEMU 8.1.0
>  * QEMU 8.1.1 is released with a bug fix in the EBF program
>  * Host is upgraded to QEMU 8.1.1
>  * User attempts to hotplug a NIC to the running VM
>
> IIUC this last step is going to fail because we'll be loading
> the EBF program from 8.1.1 and so its hash is different from
> that expected by the QEMU 8.1.0 that the pre-existing VM is
> running.
>
> If some changes to the EBF program are not going to be back
> compatible from the POV of the QEMU process, should we instead
> be versioning the EBF program. eg so new QEMU will ship both
> the old and new versions of the EBF program.
>

I think it's too complicated to maintain backward compatibility with
eBPF programs in "one package".
As we can see, the eBPF skeleton may be changed not only by bugfix but
with changes in libbpf(g.e. libbpf 1.0.1+).
This may lead to issues when with a newer environment you can't
consistently recreate the "old" skeleton.

To solve the case - we need to "save" the halper from an old package someho=
w.

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

