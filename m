Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D4031C276
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:32:02 +0100 (CET)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjbF-0003UZ-Bt
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjTE-0000D1-G4
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:23:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjTB-0004mr-UL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613417021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qwO/t9Kd9MZdiXBewiYLrwMIRZJ26ucysVG2/ShyEIc=;
 b=bxCqzVtVXxEU2XkOlHBjU8GX1XGG8mR6dfHyR9orx8Z56RBCqq3jgX/MVuxXtdLWKWR0nS
 I6iVR3r0ye7yJf7Th8kf/fGghKFqb+nYQTiXDTXzclkloCcws3h8WwrBPRs5EHYSN5W1rb
 NoynUSmOwmknY8YQQBemSCyUtVZw3zM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-evl5BNifMmO58uwvMUKs-w-1; Mon, 15 Feb 2021 14:23:39 -0500
X-MC-Unique: evl5BNifMmO58uwvMUKs-w-1
Received: by mail-vk1-f198.google.com with SMTP id c69so1335006vke.14
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwO/t9Kd9MZdiXBewiYLrwMIRZJ26ucysVG2/ShyEIc=;
 b=Vx6cWAhLbE8QFD6Km2hDi445Lbl9DsipJScANi1rN+6FraQKB/y6Q/8zVeWHG/zrQq
 feOeFz8MewmFozo7/Qz7CR1805PvVAjC/YITVtPkPXXs2ykagMTgRLI0CdrMxEh2LTuC
 2fDPlW5SAedY9Dwo8IJzkhohEp7EDLWtCIJuSARUJ8GFj+g6dRCw9HKliKeY8eljvgso
 4aTrR538enEC/ot97N25cUg8pm6sSMjmFVwIQgxLc1ueU8vEFkz0bn3xPjILX2HUDMHs
 fVBwavKtgHof6LqpvLCStXCa33uP3QjFxQj5FM3aKi/rDV2SZIeQv37c+GWr8TprjHCo
 hptg==
X-Gm-Message-State: AOAM530A4aZzNZRljcTsB7cXIXQcZTaTRNh6rbpobt32XTfu7S7k472k
 NNOolIx3mnZ3IIwuYCxj3Z8ADvZa2bAFsO3gBP71jAGR8CRuym9XSppXm/2WswNRMLGjw3JBd9Q
 XfCuaz3mPz4kxoHcsVLU1df36hnmNrCE=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr4277193vsr.45.1613417019098; 
 Mon, 15 Feb 2021 11:23:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbz0DGvhi/EJyILzGa8yAIMwAroQUNREexaimyIOlFNM1V4YBZbrLTl28XJgfHvTT5leccl4pb8kaeXlUwSjE=
X-Received: by 2002:a67:fe99:: with SMTP id b25mr4277174vsr.45.1613417018970; 
 Mon, 15 Feb 2021 11:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-18-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-18-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 16:23:13 -0300
Message-ID: <CAKJDGDZ7cf0UrvCeu668DXv1WopNE5578YoFvBOtZ+8UxLzwHA@mail.gmail.com>
Subject: Re: [PATCH 17/22] Acceptance Tests: fix population of public key in
 cloudinit image
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:25 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Currently the path of the ssh public key is being set, but its
> content is obviously what's needed.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


