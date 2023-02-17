Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E569B184
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:00:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT45W-00058P-V3; Fri, 17 Feb 2023 11:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pT45R-00057u-2s
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:59:53 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pT45P-0006sS-Ma
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:59:52 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id y4so2488727ybi.10
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0Opl1wLztqrW5e2VMQoGp+l57IB6F32QmC5KGlWJjQA=;
 b=Id5TXF7Qtt8bc1Lb00xdUVojNssGC9SXkFbo24OTB9y5/roTZuiB1D0Cx7pIMR8Mgn
 Vcpn6Du15hz11q56tE3me6wLthpwXteyRPdytBYE9cqbGHP6B8bALoqo1cMImdCQy862
 F3OLQJnQscDmQT8csL5R6Xue+dNID/dK7IeOL+WtZnLw7CDN8BIwDZqRKkUUnX81i13x
 slx5XYi6Gg0j/jOpF2aiKL8dblTys1LIynf2tNfKwg6jeaqQRDUs71EZmwplOCaQnGuJ
 PrV6VMOQjNjbfbllCX+rdOlRtB9QtetC51Rw6AvPHKxhg3XSL/7RC2mDxqKYgLdC79uu
 imtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Opl1wLztqrW5e2VMQoGp+l57IB6F32QmC5KGlWJjQA=;
 b=hShlLV2jB0pOwzA8Zrx1p/nzHe3yJfK5VtqbNWDyAo5wImHUc/PAmXaoTv949o7AWZ
 Bf6SDatv4D9Aghl65EB8yuWujZHCsR6eeOLVrP134hDF2qMbL12KtmIO9qrAeSK9/ZkL
 Oyf67bV1VPC9Pd5Tu1bjtwG4K4IsrpfnPIqRWfLWov2+qmV03BQwIFXcx+72HYqrTTMT
 diI6KKwjSkI+4kHlEKSSqdFk/Ul1Ecu0ZnynBhWg9KslRyd5lVsau2HO9F5Nncyxyw17
 W/2weYv2EVeqewdSaDa6nYAjd7u4Sy1dmdRCX0VNZlEgoU3zDORNPgRva1niOUtIoBsE
 Up0A==
X-Gm-Message-State: AO0yUKVZ3UI+tNGpbk7Sdtq1IMRgbVZL9lMyLrWFlIPaQq2XXlNPTU+R
 YIx8+s62ovG7rbu+v4XyXLZC6MA6SrRQVS51wCqEjm38OMA=
X-Google-Smtp-Source: AK7set+AUuH84xAU8cUaJzSvpTuZ34zUhuUa7UWUc2P+BXQaNQjz3KL+NK4VXkHwFRgMCV4F3PPT+3plQXzlwZL23jw=
X-Received: by 2002:a5b:1c1:0:b0:95d:85ed:4594 with SMTP id
 f1-20020a5b01c1000000b0095d85ed4594mr705137ybp.513.1676653190596; Fri, 17 Feb
 2023 08:59:50 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
In-Reply-To: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 17 Feb 2023 11:59:38 -0500
Message-ID: <CAJSP0QWv6mBjW8g0Cqp5VP7tGvqQUTYiSPhtRFHyn239JHDLbA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Fri, 27 Jan 2023 at 10:17, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> Please reply to this email by February 6th with your project ideas.

The call for project ideas is now closed. We have enough project ideas
for this internship cycle and I wouldn't want people to spend time on
additional ideas that we're unlikely to have funding for. Thank you
everyone who submitted ideas!

Stefan

