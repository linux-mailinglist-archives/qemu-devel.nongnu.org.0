Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2522DD52C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 17:27:04 +0100 (CET)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpw7L-0003GL-DG
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 11:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpw1d-0003bj-KE
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:21:09 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpw1Y-0005aa-8U
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 11:21:09 -0500
Received: by mail-ej1-x636.google.com with SMTP id qw4so38664751ejb.12
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 08:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vhJbeI1rEl6eYRAINgB6f3rMulfVqsPiNsdAQYL31Bk=;
 b=tV4gxMxOncSZs1zfuxFRRFb6ZyB8EqHDf25excNG0zfy/DuHNfNKJFMGLzgmyX7IuK
 ZWLZ+7UTvtkB6Z1id3VKnDMnCI7t1dx8o2vFS4PvMOpSzJsa7vJn1WgV5zpbPb8AVd2x
 PpiUmf4gnfOKoYqY6xhdqkXQDjuQeEbO0KtJDqZKj0MTObcPzFNl1npJzoO58PEGWXcx
 8BJPYYji8TOcxMiFmRHPHe+AHGC7hj0hkNskQbqeOl12N1iulOplAwI1AVQgRkp3F8Px
 LEI4+tRKyBlpXukocUzHD/JrByROzMuXw7INhQGdNBMv535FP+kjAtPm+VHoZyER72YS
 Nojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vhJbeI1rEl6eYRAINgB6f3rMulfVqsPiNsdAQYL31Bk=;
 b=tO+m53SoFJhMr9RxZoebOGQSbkqTDmbiHoLdMqqtfBfG3yPIbmJoeqso7s3AMQQ3RW
 vzdQqdshQGVWrOHSRuEZycMMzozG1dAqRyroP7Iky2EcUkHCv9wptUtuzP6rtqrzFE2J
 GEIpxzVCeRl5519ITkNZwPw4jMiNY8+8uvOmMJGK7ZVx4CDQrxq6hwGYjsc3VkRuxFSo
 E9rtGyuoklJmnJRR0iVbSaHMk5w7cvhhhoorFHg6TFDLhC1hyaODhx5hxku3VnZsCEas
 jOharhTDshtHk0BAOdILQ+3sYShmRWT20d7Prtv6VeiaI9bucvWULrZSu0OrB+oEi5Zb
 yhmg==
X-Gm-Message-State: AOAM532asoW4JvZLwqpHNX6uqTqcSbXDE6rq/KiXH/2CCOWOzQPEho6O
 vJqC8LwTfMtgR0ebaOhwzYTEZxgGUJOIKytIafLjWA==
X-Google-Smtp-Source: ABdhPJy7/M4auDKjGjS32mSMOdWhejEl5ML9hZoaYfSMcHSBh7m7T2b0BTwxsmtEAX3J/nWiMKTbyKVfS7JUQqXi8GU=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr36223148ejr.482.1608222062663; 
 Thu, 17 Dec 2020 08:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20201216172949.57380-1-thuth@redhat.com>
 <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
 <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
 <20201217140012.GF247354@redhat.com>
 <CANCZdfpQeiWNt38D60W7un0vkK-GRCU-fShW0amfiwjKs=Wv-Q@mail.gmail.com>
In-Reply-To: <CANCZdfpQeiWNt38D60W7un0vkK-GRCU-fShW0amfiwjKs=Wv-Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 16:20:51 +0000
Message-ID: <CAFEAcA_gs5wqr258FBTAKbctKLf4J4etvvu0hfeFPtH6gRy2+g@mail.gmail.com>
Subject: Re: Status/future of QEMU bsd-user impl ? (Wea Re: [PULL 00/12]
 Compile QEMU with -Wimplicit-fallthrough)
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 16:03, Warner Losh <imp@bsdimp.com> wrote:
> On Thu, Dec 17, 2020 at 7:02 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>> I don't recall what happened after that initial discussion about
>> merging the new impl. Did Sean simply not have the time to invest
>> in the merge ? I'll CC him here to see what opinion he has on the
>> future of bsd-user in QEMU.
>
>
> I've actually taken over for Sean Bruno managing this.

> I'd love to hear from people ways that I can speed things up.

There was a bit of discussion about this on #qemu IRC the other
day, coincidentally. I think the conclusion we (upstream QEMU)
came to was that we'd be happy with a "delete all of bsd-user
and reinstate" approach, assuming that the "reinstate" part is
in reasonably logical chunks and not one big "here's what we
have all in one lump" patch.

AIUI from IRC this is being primarily driven by FreeBSD and
NetBSD/OpenBSD support is merely "we hope it is not broken
by the delete-and-reinstate but it was probably broken anyway" ?

thanks
-- PMM

