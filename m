Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF349111B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:42:08 +0100 (CET)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9YpL-0003B9-Qd
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Ynl-0001W2-7N
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:40:29 -0500
Received: from [2a00:1450:4864:20::336] (port=53235
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9Ynj-0006RJ-Gi
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:40:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id v123so23107735wme.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 12:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/G/zpI6h8JVZTPnmRE+XQViK6RMM91m8ibYSfyt9qq8=;
 b=divDtYNzY3uNY8v07z3RlNxiwx9u4QbE+uuEfpG07bvNv64ed3PQzg1buwfnDFpx2W
 GzuVUCR9r/TqAgkYKT1ffEGHPzm9lE5nmIr8JBSc/VGcYixhHsGeAkuycOP/BMYhoeoo
 +vYuunxZStbiiFYq7jwp/P08hEvzythMEbwuKuaAy5sSmYUjjG3oKp95qCGPQ1JOIxBI
 hf9NrSPG8jXqrOG73evo7Ux8a9cyf+xNiAa//fOc0VHfFe1zwlzqiiQhxU1fE5gQHAo2
 h5kPrO4QU+hWF5AnqF5IKTsZYbg/bDcLGJrwX52ed322UrrsZAVXwnq6IEjR30zuyAUe
 klmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/G/zpI6h8JVZTPnmRE+XQViK6RMM91m8ibYSfyt9qq8=;
 b=gKXcNg5RZ9OEpt2AtfDn7ihLmtTqik+MtJ9jXiYO2u5Qn8wHi3kxOeNdCyqCj6uEqG
 7mYqcyixEJnPRif0C5MLzfOtDeastBR2lCApl9AqlXt4YE2JCBThmMnT9spOEl0HppUw
 AFS5iJFHCKhc3mnzgSKBQjNFvmk2BHt+vajQn26mZSEiJt12HDdXB+7Ie8gabiXFYLJo
 +AVZMqKXE7tgOuXs7Mx742qflWG0Mt8kd09CvKeC2ojF2ySMowgfP2JVRa/699GrSevC
 ZJFzrpvJo2/EJb7utEgJYbxzlfOcOQc8P23YdR0+rg0eBunyL7iYLRCkX8wooL+AE5D0
 lZbw==
X-Gm-Message-State: AOAM533FbhwEupfb5pgnPhAwQ28qQ4zCp9/s3pjmsqFujWRlql/HoJ3O
 1J5vovO3BAJanT9AN62hhNAHiheWT0tAL2Yt96iT7w==
X-Google-Smtp-Source: ABdhPJxSbv4gEyuuBlFNY9GZ+B59kYrp34D2fIEoPXwpSO5CKAgTDOeU5d/AW0vaxhoFMSVgPkRWk5CVnMWcB4ROems=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr21738860wrv.521.1642452025426; 
 Mon, 17 Jan 2022 12:40:25 -0800 (PST)
MIME-Version: 1.0
References: <YeB0zGRC/ct8DAzM@work-vm> <YeC4xYrYhdAKKwTx@yekko.fritz.box>
 <a2b11256-5afe-42de-ffb3-dad07c8165b3@kaod.org>
 <YeUEB0lb7mhuoP6G@yekko.fritz.box>
In-Reply-To: <YeUEB0lb7mhuoP6G@yekko.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Jan 2022 20:40:14 +0000
Message-ID: <CAFEAcA9fcjH7Om8rDMdQ+=cvjaJjWEg2j=CvjE3Lk3kZ0d_y7g@mail.gmail.com>
Subject: Re: ppc pbr403 vmstate
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, quintela@redhat.com, danielhb413@gmail.com,
 qemu-devel@nongnu.org, groug@kaod.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 05:52, David Gibson <david@gibson.dropbear.id.au> wrote:
> It is also touched in the *super* old cpu_load_old.  I suspect we
> could probably just drop that completely, since I don't think we
> realistically support migration from a version that old anyway.

This would be a nice thing to do, because the PPC CPU is the
only remaining in-tree user of the .load_state_old migration
hook, so if we declared that we don't support migrating from
those old versions of QEMU (1.5 and earlier, I think) then we
could delete the .load_state_old and .minimum_version_id_old
handling completely.

-- PMM

