Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF76ACC83
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFXn-0003Jx-Tv; Mon, 06 Mar 2023 13:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZFXl-0003JW-HI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:26:41 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pZFXi-0000CZ-Ue
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:26:41 -0500
Received: by mail-lj1-x22d.google.com with SMTP id by8so10653299ljb.7
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678127196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PV2U2rCtklqWOhUTOJLtT+lXxSR2ujSWVqDrCTLHI24=;
 b=PpInjJNNJVxwezU1XGPNL4sYYq03ArYTDqm7xZQ8KduUKkgDXDsNw1srGAeKC8RuUB
 MAR6UD03vnKACbF2LTr7y4IDbYnU6DfOyQtJd6v+idArxyt5K5Fm2JNczuLtxGnma47s
 Th7RN0iFREMzXKQMX6dwAappGspvj9Wk9/zf/Z0FYgAhlzlgeN2mQ7fgy3dlHksWYL0g
 mxs0ZBXH5dc62kE838MapqoBsGYyozQrAP1rXHXu+vdRDtKnv4hjcV2mnMiv3co/B2RH
 ZfWvIZd1jKZn8a/qV+rMqBeA0byRhiDB15ckR7iQ9ieJ2P8TsMzoUhpENo6cHMduI0Zj
 OLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678127196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PV2U2rCtklqWOhUTOJLtT+lXxSR2ujSWVqDrCTLHI24=;
 b=lvI7vX5azG1H1IVE2SZSMF7Ac7jWtitNyjiPb/g8CRL6XzYyGsO3quWaQXarTar+hA
 nQ85ejy/+Sgjht4lqmUDsvsJIFb8oGwZzNrq7cAyUHN6MxShNYQjyq+PQaPjoIhxsUgP
 HMPwGRGPwbiNs16tu9zNPygZE1LqcRgOX24BO0fBPgpl77FB3jZmBAPoAEx/xqn/JZn/
 O6X+w6F0bPGw2b7vvqQWnitPse6pkiRZ1tncR6TKe27IW8bLSkcLy6+q6Vj9sCFbWRdK
 zUxVT3uB8t8GhHH9JGeT4OllxSx1+Mg1LZvQ77hBFKW10imoVbFlLuZfO5zk2tGYj04a
 eA/w==
X-Gm-Message-State: AO0yUKUQr9bPhqZmn6yXUYVWWoeniA7oArGGDyzhZ/FMwcHgOanyK7x3
 x8pxBGs3vr8nbk2xWxnHail+wLpqNaUbsO5vz0c=
X-Google-Smtp-Source: AK7set/HpKQOMj5PTe+CzHOGISz6EImcZvscpYZauW0uKamahlB+B9/Uhhbd8dUgLytuS2XfiEYNdgxWSnidJKumVMk=
X-Received: by 2002:a05:651c:318:b0:295:9626:a20f with SMTP id
 a24-20020a05651c031800b002959626a20fmr3459085ljp.1.1678127196441; Mon, 06 Mar
 2023 10:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
 <20230306122751.2355515-8-marcandre.lureau@redhat.com>
 <87o7p5hnqz.fsf@pond.sub.org>
In-Reply-To: <87o7p5hnqz.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Mar 2023 22:26:24 +0400
Message-ID: <CAJ+F1CJ0x5erdv8EymF1gq78Mi1rcNhNvpJLcMXgvJpQxBAJuA@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] qapi/gen: run C code through clang-format,
 if possible
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
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

Hi

On Mon, Mar 6, 2023 at 8:03 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Does anything in the series depend on this patch?
>

Indeed, it's no longer directly relevant for this series. It's a
left-over from various iterations. Nevertheless, feedback welcome.

--=20
Marc-Andr=C3=A9 Lureau

