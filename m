Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7AA69B175
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3zC-0000Po-UQ; Fri, 17 Feb 2023 11:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pT3zA-0000Oi-BU
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:53:24 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pT3z3-0004gU-0j
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:53:23 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-53656e6bedaso20814447b3.7
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z/hRZYR3fVpHyYpO+oH5zoICQrmOs+J1H6tsMPelw4A=;
 b=lhjA8MbStWGfo26CglkUGgucX3s1xSLnittXgq74TCMNsEAUEHoGmHDakQZiT+Zeb+
 cxYZX4Z4DSyC8QxG2FKstkLr6zxMTgZE2qCx+hKnPu93Mdrk9QVrPAlIUMaGmjsOobPT
 xeMQlcciVkT8v7vNAomlNUQ9xwNWZoz+3q0cljl0yrMWslvurXST8P03gZD/9cs5tn3/
 W//CMRqz136aMbLKctrEdYn0YH7FnC5Aa/BS9NEWvlxqDBx5y5PuHQ/M0MCMpXWkR94Q
 ndELdimx/4EW/dmspjd2rXUu/8J3O9Bm3uwQHCEGBB6JuIzFb2cTkIDI2vgl1xY6sZCm
 8JKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/hRZYR3fVpHyYpO+oH5zoICQrmOs+J1H6tsMPelw4A=;
 b=oMYCgYGsgfK84H7hj7Vf9CSeGFO4deVerC3jAXH5G570RChfhIz1ws2COzDCn/t8P7
 00AP0z7Ur/oQMicQCeHZtsyazpL+RUpmCCbwgi2la6CFV658L8Lr8cYkJOS+7uOAVS48
 uakqmkJOhfog+li+iXhyVHtXLo33xa605v+zrlxHu4JF5T+ODmlsJN/kLcM/ez/n7CKE
 cF++Vo3vy0X65BH/JVxcbeND0unpwwculuILzT7si42A1fDx7b1yutC2t/w56PA1Wk50
 7RVDl4Zi/Lwqy2nMeUtcVxxFclwPcZMHUhPQG14oR8seEqXMUXl2UX5U3AKcBA/SKJPU
 NnMw==
X-Gm-Message-State: AO0yUKWlAw4rbYZMfysgKs9Vfc8cEJ1xO5I3HRgp1Bi2s8x01QhQuiAN
 q5kKVeY2BUVjhYiIzI9MdN3IEr7s2Ctm+qT+nMA=
X-Google-Smtp-Source: AK7set8nB6PKjkOu4hIviFl1ja2lfs+XKEzHTQQnjzxsICmvHJvlSkKhj56yCtciQKCE6lBz5tmGVYmYAJqIxlwq1d4=
X-Received: by 2002:a81:fd12:0:b0:4f0:64a3:725a with SMTP id
 g18-20020a81fd12000000b004f064a3725amr1275366ywn.229.1676652795340; Fri, 17
 Feb 2023 08:53:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <20230217162334.b33myqqfzz33634b@sgarzare-redhat>
In-Reply-To: <20230217162334.b33myqqfzz33634b@sgarzare-redhat>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 17 Feb 2023 11:53:03 -0500
Message-ID: <CAJSP0QXDD5uyY5Neccf4WmGyuXwHuefwbToBdZDwegV2XHMnHA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 "Florescu, Andreea" <fandree@amazon.com>,
 Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Feb 2023 at 11:23, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi Stefan,
>
> On Fri, Jan 27, 2023 at 10:17:40AM -0500, Stefan Hajnoczi wrote:
> >Dear QEMU, KVM, and rust-vmm communities,
> >QEMU will apply for Google Summer of Code 2023
> >(https://summerofcode.withgoogle.com/) and has been accepted into
> >Outreachy May 2023 (https://www.outreachy.org/). You can now
> >submit internship project ideas for QEMU, KVM, and rust-vmm!
> >
> >Please reply to this email by February 6th with your project ideas.
>
> sorry for being late, if there is still time I would like to propose the
> following project.
>
> Please, let me know if I should add it to the wiki page.

Hi Stefano,
I have added it to the wiki page:
https://wiki.qemu.org/Internships/ProjectIdeas/VsockSiblingCommunication

I noticed that the project idea describes in words but never gives
concrete details about what sibling VM communication is and how it
should work. For someone who has never heard of AF_VSOCK or know how
addressing works, I think it would help to have more detail: does the
vhost-user-vsock program need new command-line arguments that define
sibling VMs, does a { .svm_cid = 2, .svm_port = 1234 } address usually
talk to a guest but the TO_HOST flag changes the meaning and you wish
to exploit that, etc? I'm not suggesting making the description much
longer, but instead tweaking it with more concrete details/keywords so
someone can research the idea and understand what the tasks will be.

Stefan

