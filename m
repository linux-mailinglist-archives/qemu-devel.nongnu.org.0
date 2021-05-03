Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD9371932
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:24:20 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbMp-0001US-Th
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldbLr-00013a-00
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1ldbLp-0006f3-Jv
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620058996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKpRIkx6JhvxBQrboCpgzr5H0DyWpRy4cCzeDzEGhMU=;
 b=OqwUgVLcW3DvOtIWoN7gQh+kFS1c0LDm9yQ8smURdsZM9G9G0TQJB1/WYqjgd5ik42M1Kb
 Elzae6Qi0nxGxTGDIZRXhsW+z406CUiV9ya2LsNDtxpbKLGNFxBC1kLPuxy8vmGz0O0b7v
 nXId4blxtdwwmx3wiel8krCXER8uhBM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-jsP5RP1NP4qNCHIzBRFqGQ-1; Mon, 03 May 2021 12:23:15 -0400
X-MC-Unique: jsP5RP1NP4qNCHIzBRFqGQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 4-20020a0561220884b02901d0e1d6a03cso871803vkf.21
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nKpRIkx6JhvxBQrboCpgzr5H0DyWpRy4cCzeDzEGhMU=;
 b=dfcDL6y22j7eKu7x2v8ImX+kP6Tq5GkOHgUeIuzF5FezlG/MLR0Pbqm+wqnGbMYx1m
 FC+cimDZ+CgmktLXKhFq33GwwHdSLg2he87By8leAaP5wbmM4u+6J5gfz6WSCLaXE2AF
 hiHBXwX/QwJp8FKBYEHoSKH49c1195C/qosprQVl6C4UUiGN0t9tc1S07TONASVCxpLt
 CFG2VwzcLDsHz6iCGK6gjF+fsedHCrN1+2cX+ecwzkb62zmElpAe+1E8XKn18VqpTI0N
 epITCcJf348qjf5wgVd9FxijLaPZmA3H9MlMFCL4nLOUOLNEirXZCdlkWobGaBtfTeqQ
 Ln0Q==
X-Gm-Message-State: AOAM531mb97odfGh/JbjCDYBhxvnu4j8wE3ALV75512rpTn4JlJFF/m0
 lcgepu6Pj9nxamFQ/efXKGZ2QleQx3m6M8B8Vb5NNT2omAf3UYQfT8v3L1z6zkOCdaZ7G0OIFJT
 a0l+UttciKbpn4kJCgM9dTcWsrXGD4zM=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr16990127vsn.39.1620058994744; 
 Mon, 03 May 2021 09:23:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8R93vWhoc7gJL6mGIuiHwhQT+vegq9+knR26rJDcrJs1RlQuUBOsLgk0kLCrwPEvnKKGiJK+KwHFSacFpAFU=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr16990107vsn.39.1620058994614; 
 Mon, 03 May 2021 09:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-27-richard.henderson@linaro.org>
In-Reply-To: <20210502235727.1979457-27-richard.henderson@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 3 May 2021 13:22:48 -0300
Message-ID: <CAKJDGDZ3otPZeZgXEpBiXkuGL4f7Mqm3P1NSuwQvUkh3LdwnDw@mail.gmail.com>
Subject: Re: [PATCH v6 26/26] gitlab: Enable cross-i386 builds of TCI
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 2, 2021 at 9:14 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're currently only testing TCI with a 64-bit host -- also test
> with a 32-bit host.  Enable a selection of softmmu and user-only
> targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.
>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


