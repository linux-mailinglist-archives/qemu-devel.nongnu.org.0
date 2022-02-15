Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D14A4B7B7E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 00:58:38 +0100 (CET)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7iP-0000xN-7z
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 18:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7h5-0007to-Bl
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7h3-0005mU-5I
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 18:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644969432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2TxbWO1imlH+6Ir6RUP1tAQZhWK/h98F6JrA8NLSKI=;
 b=P4ydHR7pO8Ri8mAdtQPAs3RJW8IsyJEaatKvPBIFpAoxg5HFBb0FdlupKlaKBTnX2qr4Lq
 bg4WKO2+LY80/buktG0CCb00NuDdrRRhH2fw38hDsLm+TWQkn8hqu3VdAZFq0BfBv7wMkD
 xDogvfN5ujZS+CdBNrD/ZIwRb/LGWds=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-_o-UUo7GMYKcuI3hRZosFw-1; Tue, 15 Feb 2022 18:57:11 -0500
X-MC-Unique: _o-UUo7GMYKcuI3hRZosFw-1
Received: by mail-ua1-f71.google.com with SMTP id
 q19-20020ab04a13000000b002fef2f854a6so280192uae.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 15:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2TxbWO1imlH+6Ir6RUP1tAQZhWK/h98F6JrA8NLSKI=;
 b=Ku1/Epe+V3kUNxOeGmv+hKrejPiM/ICAPObSm0zuN77ok2ZXrZlTjVg+xz5mwdXmtj
 l1/KvZfK+dNTyN63rfFbGtZHRqdpin8GHVBvVSLdfZp3OpAUnGWvEhHzmhmYl840FuXw
 A0cfzLuDqOZ4KPKVGwXUy1v7a5Dfhcz9uZVjEBEi70VQw5HMcpxYn30iN8RgqiD6pVci
 DHTFxVPgRuxhPTzGWauZO66Exi88MSNi/X/hA5B9ydv38zGdKSDYEp8OAe4ptX14QAVS
 deHGnY8Jo3sZVrYWiRmbawmGhN7WtROD/+fjplzhPTdFIMXdpb4OKW9Xq2rfmThnpeHp
 gdeQ==
X-Gm-Message-State: AOAM531fEznMk50xsemzYPNmN+1mXICIjA7IjdEWMc8OlpKEe7vDWPR7
 zq1x3OJYql3iNCCoWL4oB3VhtzPk8NPSgEXYq93aUMHvQDb1gxkmTCeyOo+RYzo/+ApFnVmrDRY
 dQjPBfkR/yPutFAmLZD4JYwBXmnaQgNk=
X-Received: by 2002:a67:ed54:: with SMTP id m20mr591105vsp.61.1644969431130;
 Tue, 15 Feb 2022 15:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy20NJpdP/v2BRzddbiA/0j72Y0fJG5mPtaDoF/OyMX5TIPXjJeU+tUyf2ZBMvucC6/TJZ7Rr7DKf2pTOgIABs=
X-Received: by 2002:a67:ed54:: with SMTP id m20mr591088vsp.61.1644969430901;
 Tue, 15 Feb 2022 15:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-4-jsnow@redhat.com>
 <20220215230443.a3hkbcchlsyk5c6q@redhat.com>
In-Reply-To: <20220215230443.a3hkbcchlsyk5c6q@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Feb 2022 18:57:00 -0500
Message-ID: <CAFn=p-aYxTQP+gXcKrp5=1qROJnUVDaG-W4KGN6KHOFgdet64g@mail.gmail.com>
Subject: Re: [PATCH 3/4] iotests: Remove explicit checks for qemu_img() == 0
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 6:05 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 05:08:52PM -0500, John Snow wrote:
> > qemu_img() returning zero ought to be the rule, not the
> > exception. Remove all explicit checks against the condition in
> > preparation for making non-zero returns an Exception.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> This one seems clean whether or not there are questions about using
> enboxify earlier in the series.
>

Yeah, if we don't want ~fancy~ text decoration, the rest of this
should still be broadly helpful, I think. There are simpler text
decorations we can use to keep the output from looking like traceback
soup.

--js


