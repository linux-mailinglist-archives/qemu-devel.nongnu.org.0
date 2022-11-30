Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB663CD1B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:05:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CT4-000190-2o; Tue, 29 Nov 2022 21:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0CT1-00018g-Gh; Tue, 29 Nov 2022 21:04:56 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0CSw-0006zQ-6k; Tue, 29 Nov 2022 21:04:55 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id 205so19846747ybf.6;
 Tue, 29 Nov 2022 18:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eYrE5eCvc6sJcoSErK4SCJIreuvgpNkprrBEP1plTTE=;
 b=c3ElgtMjR0ONuQSLTWuK4rAD6pWn6VZ8hUfvn+UkUKwDUXzSViU/MQmSfCb2upCs4g
 eARWw433sEzwiIRN5qXsHdqi2kGnNHOA3IG5ewaba3z/en70WLMpkMDUsIa+wQHdNBQR
 49WbxX4/ZeQ1S5I7wSgEJ3yb6FJ25IVEuTWk41mPxIly/0u90YGBdpZgX9YvzWm2srgL
 KhQX0LwbpyZedvTufSNXU7AHe8itfSwDl8X1RGhIgPYg+mPSGDrGraWSiP7spiMSzDHE
 9z+vyeH63uGfKw4NCVtFzQywgThzawcH4LpP6oIHk5ATrRuGUN3OiozkZuGTukUzimzx
 GuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eYrE5eCvc6sJcoSErK4SCJIreuvgpNkprrBEP1plTTE=;
 b=mMESF3VuIVBBXitwlkdrNiLFoPX18EtqDhp+1lTLz1ctVpK0rsgVHIg9rzkGlXuo9C
 UyIupFErujLAFE0pZ/Fs5UDKh7830bEWqHS81kTyYh7De/72k665gn3bGJQ9tS9GB1Ps
 TaUTLUMc53BBeVxiSs8aznwS9XFyJN1vPVLBA6l6KNzvUjWmKlMPM/kE1roX05FBVXwi
 6aJfwScoGaYvAFbjiBnRJaXKsvVZ46hni/AGfT6ebtV5M512lYU3k9YTnDZ472dp8Smo
 ODmfil+tsLpkcHii213ItmkAQOWiOwXRxLh+1Bvdo7nBBohS1P11EK6GbZr0/QiiAvXP
 yPaw==
X-Gm-Message-State: ANoB5pk2Ut45D09u2MokGunLWDsnFhFct3y8xA5Ng50kW9IjJlexTb1c
 6DY/3gM7clIo6kxK3TkNJ2Pz12Tf3+eupEvS9cyy2hG//Yk=
X-Google-Smtp-Source: AA0mqf6BcXqw5w+4VzfpJt4SsX6jrl4Wf/9CBYxOUePTstbVb873Xz2tWweYSwPJbpWKQgTHKQ1NET8oj87LYDKClf8=
X-Received: by 2002:a25:a189:0:b0:6ee:f3dc:b8d0 with SMTP id
 a9-20020a25a189000000b006eef3dcb8d0mr36722697ybi.642.1669773888673; Tue, 29
 Nov 2022 18:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20221027154504.20684-1-faithilikerun@gmail.com>
In-Reply-To: <20221027154504.20684-1-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 21:04:37 -0500
Message-ID: <CAJSP0QU65WyUFCP4kc9u3kcDAysneLFSGTFCJP=jRixBOS9FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/8] Add support for zoned device
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, 
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org, stefanha@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, 
 dmitry.fomichev@wdc.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 27 Oct 2022 at 11:46, Sam Li <faithilikerun@gmail.com> wrote:
> v13:
> - add some tracing points for new zone APIs [Dmitry]
> - change error handling in zone_mgmt [Damien, Stefan]

Hi Sam,
This looks very close! I sent comments.

Stefan

