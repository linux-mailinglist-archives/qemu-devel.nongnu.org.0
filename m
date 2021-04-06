Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B88355B07
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:08:08 +0200 (CEST)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTq7T-0005Co-AM
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTq4J-0004cF-47
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:04:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTq4H-0002jQ-DL
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 14:04:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id f12so9203726wro.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fKIDhfZPNxdm0Sd1ZyZuypbdyis/Bd7TvMaK2ug9AXw=;
 b=TxpPyvcnK4gmE6oQrBIrsImD2XRKfbMjUEmc12XG7mERNPJ8Vb1iRAlXN3rYNotUuv
 iiDX1f0wfhfQUrfv3Zz0QvLcfAxfZyQnP3GVdxYFrh90WmJ9G/BgydsEiUAgOzisql6H
 dLWh3kMhbSnZ7GC0D8VavWN10PTqEuus/wBUns79JDY1wfMCXvpWqSM0HwhigS3ubhKR
 VU9ZYsOv5ZrgiqypPcqkqGydZ5zno6/XXTSn4c4FFv3UaFItg9XsGCypO7pojv4SHRdI
 LIyOJb03O3pTRfkUIm+zgZmmTR2+4wiE42h4fhNd69BpcPljIaBhxOlX0F7K51JDsdyl
 zvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fKIDhfZPNxdm0Sd1ZyZuypbdyis/Bd7TvMaK2ug9AXw=;
 b=qdpNMMz9dpDgWYVIOifNOL2XnAsRfOzsrJKuVOmTlP9B2YZBT7LouU486D2WMO97iO
 APteaf3DfrUVTAlOJjbwv7pD9BqcMC0sYNEss1ZQXVJrk9y5iaFY1CNXxA9N5i3YT7ce
 v7yQSH5uL4wCKldc+bFUC7xiYJMmsXRBr25E7beilQQponmTm+cG6vf4mJXzz3d8ltPv
 rf3/NuVEXMkFjAQjblY8v9GK1M5y7WZQOJorhj4Cj4w/DMklgd6vulfE+hkCHCFGZE7v
 GxzjbPy8Jd5Rxf9ucpscLG+xYocA6iDj+GiMvP3EKahM9iUZN7+DbeLX4DndFLzIY4aU
 mpxA==
X-Gm-Message-State: AOAM533LzjXfrJSF3ZNNbxdnb3b//K6f0rYazvDrBmT4b2G/rIarObse
 YnJ9Acn8KMAzQTlIdG392yu8zQ==
X-Google-Smtp-Source: ABdhPJzyC4EGhaCgOTsbsgHVBeqLHyCkGOdEnx7XeZ7kYHBZtWV9ppgaDfef61FH3rQwfYgsPH6xNQ==
X-Received: by 2002:adf:f682:: with SMTP id v2mr12708034wrp.263.1617732287468; 
 Tue, 06 Apr 2021 11:04:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g124sm4279304wme.41.2021.04.06.11.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 11:04:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40D291FF7E;
 Tue,  6 Apr 2021 19:04:20 +0100 (BST)
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
 <20210406103643.xutdwigf6kg446qo@schnipp-desktop>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: Re: [PATCH v3 00/15] tests/tcg: Add TriCore tests
Date: Tue, 06 Apr 2021 19:03:59 +0100
In-reply-to: <20210406103643.xutdwigf6kg446qo@schnipp-desktop>
Message-ID: <87blarwaqj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bastian Koppelmann <kbastian@mail.uni-paderborn.de> writes:

> On Fri, Mar 05, 2021 at 06:00:30PM +0100, Bastian Koppelmann wrote:
>> Hi Alex,
>>=20
>> after a long while and thanks to Thomas reminder, I finally came back to=
 this
>> series. I addressed most of your comments except for the timeout --foreg=
round
>> problem (see https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00=
921.html).=20
>> I just couldn't figure out why QEMU hangs when run from the Makefile.
>>=20
>> You can find the full tree here:
>> https://github.com/bkoppelmann/qemu/tree/tricore-tcg-tests2
>>=20
>> Cheers,
>> Bastian
>
> ping?

Sorry it dropped off my radar, added to the TODO list.

--=20
Alex Benn=C3=A9e

