Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B86D0336
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:32:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqVM-0000nZ-Po; Thu, 30 Mar 2023 07:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phqVF-0000mE-If
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:31:38 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phqVB-00006e-FP
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:31:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id z10so11094956pgr.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680175891;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LcSryHPmr8lryjngsOsPg/86/Wskup+th0s8PwA5E5M=;
 b=3VYspWgDMN5oMqRl1jFWw+TBLiKeV7DhohbBtcOTpx1MKWBbSOdrNunvQ0G8/IEZwJ
 +1WVLfHH+akVnu8MxXB1r/vK2NVcMmdQwC7h71ZGmVZ5sgFKpC/BseWUJjA0qNr6SGIs
 ZXWnvxK+vNv9JhCjXX+3oaC3Ewqd23C5zx3ly5/yk0t44ausuenvqAj9W4Q9onmPDCdo
 fDK1mW/VKTJ2a5TeNROzTSn5blwbfebNeKgW4iXx4AWXtz8nmhWi4Jc5DasuLQHIgAj1
 OdufPzo4HXhFYYz+NwNO3tSvxk3Li8xFX9A9l9J3VDthUHhuicfs9/SKilt8YbLu+LaW
 mQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175891;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LcSryHPmr8lryjngsOsPg/86/Wskup+th0s8PwA5E5M=;
 b=XXhGJ8o26bcT/as1xXIdIyZ3RCrc8U0eGQVqPTlFfRObciawyuhhM2S/FBw5Tmsc85
 sFfgpbkDVwh3mILYq86Z43q1iZXFlfFKHehadz0sP4zZf/TpzlW9RpPD1KwhzW984ksP
 shEHPpknohme0n3ajnNkgqdYWYDh2aVcsNKjCX9Ik0RCOcIB++4H41CdKO/V3tm4XiIz
 QeqX02+8IZ/vYuVHS+VEAyzg3Nt1oKEq9UxYXAOV4Rmr6diF2LlLx9C1dnc+nQasJfhN
 yAdAPFvxwrrmzWubqCgRh2gIsfPMGUvq6MP548rqfhmyxZHy7+g0cPkgJz8xoOG9AP+q
 mG+A==
X-Gm-Message-State: AAQBX9e/AthhIWIf39y0FLVMiS303+u8DRo00NGpu/r/5dtm+om5Slda
 Gpmwj8J5713l0+NMWcJXIMznHo83TzcKmt5NUeHKrQ==
X-Google-Smtp-Source: AKy350ZnWr1r+D3dw9zROdTg58SBzv9CZS1AAwpqQkxOxGk6h1Z76A1iLFdr4NQiPZu0JlqSqg2OYzrQAPZKwaL0M54=
X-Received: by 2002:a05:6a00:1894:b0:622:b78d:f393 with SMTP id
 x20-20020a056a00189400b00622b78df393mr12334473pfh.2.1680175891285; Thu, 30
 Mar 2023 04:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-2-andrew@daynix.com>
 <CACGkMEuiEgerMzuZvykQ=8ML5CW9rdi4h6da5tDeuxER-jSPuw@mail.gmail.com>
 <ZCU1497ElEvDbwnG@redhat.com>
In-Reply-To: <ZCU1497ElEvDbwnG@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 30 Mar 2023 14:13:39 +0300
Message-ID: <CABcq3pGMYucxpr2CLFkQQNDWBJwCrtLm9fFbBGALfVZ8iFfzqQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] ebpf: Added eBPF initialization by fds and map
 update.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=andrew@daynix.com; helo=mail-pg1-x52e.google.com
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

On Thu, Mar 30, 2023 at 10:10=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Thu, Mar 30, 2023 at 02:53:16PM +0800, Jason Wang wrote:
> > On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@dayn=
ix.com> wrote:
> > >
> > > Changed eBPF map updates through mmaped array.
> > > Mmaped arrays provide direct access to map data.
> > > It should omit using bpf_map_update_elem() call,
> > > which may require capabilities that are not present.
> >
> > This requires kernel support, so after this change, eBPF based RSS
> > doesn't work on old kernels that only support syscall based map
> > updating.
>

It would not work either - bpf_map_update_elem() requires BPF capabilities.

> What kernel version is the cut off ?

If I'm not mistaken - something like kernel 5.5<.
But in any case - the RSS eBPF program is quite big and would require featu=
res
like jumpsback.
So, on old kernels, it would not load.

>
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

