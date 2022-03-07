Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA94CFE71
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:27:23 +0100 (CET)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCSQ-0005td-D5
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRBxn-00042F-Ug
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:55:43 -0500
Received: from [2607:f8b0:4864:20::b35] (port=39538
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRBxm-0004Ld-Dm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:55:43 -0500
Received: by mail-yb1-xb35.google.com with SMTP id x200so30338591ybe.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9JUQnUVdAxMzgzXrLqeBV2lMYGzbkVsPMoyLYAPkmsA=;
 b=AfmmehPu56RWWODZNOnuvuSo2zqSfLJ/SlVISRETHy/3O9jZKc/ZfubzCc8ovBOnas
 afXr15rcNEKdTpCOElq7bjfMFARxKYH7eRBtK6XON6yYqZjwngnZ/6EXg94IeUTlznYH
 7lDwy7GFocgVhCGt7TR+Vn4GLXL1ZpHkiDK5rDu23UG6Uhrzw7bFZHZH/G53Ld4y2ZXL
 El7KtKOG0rV036luBGHX2b5z9yeOQ3PaGQS4Mxkr7eO2aU0Zx7e/YOYBYApsTTClLx32
 rIiA88z35pGtjRBeJtUpyW3qMJRdmycHNSCQUKwpK3vO+mh07wrXkh5PKf8je4B3FiHE
 7xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9JUQnUVdAxMzgzXrLqeBV2lMYGzbkVsPMoyLYAPkmsA=;
 b=vnEkUQiHaVeNkUpqLmPyg2A2wf23xvKhiCB0f4j5Y5AvG68w3Tl4gSAKG8fOr7O9Ai
 iyrjKkGXf2xPLx4Fj8+zYRkh7T4szeyVrRp3OUjp93G4b3e6Itvauq7MrCLDgioHIwCE
 S1BjcpSGHZB2/kXP4TgsO10dA5MFjlEEN5KG6IJPAhq7jBZKaoN8ilLbNTrDuQO1KdCe
 8n14oNCju/1K+Kn53O+EyoII9U+QoVnK6Oyp7PcETe1I06qWG4oRVHzn7CBYUyOEYMlM
 kb9deJBewN0VPM1mTZOVr3gPyc3EjvlAacCS4wEwzfs/5RmQs1ssgpglXCh3shAqJRHS
 C0Qw==
X-Gm-Message-State: AOAM532ZeUIUn0R9Y99NjOlWOZ4mtnA9B+X9gsFAm6Xvvgv81fLWupzn
 2Bxz9ivuyQplIUVQV4xailkWK1kcErduYoLrdy3KDbdqgr3D3w==
X-Google-Smtp-Source: ABdhPJyBVqCCYkvFtY7l+uywSQdN8O+DaNGvfCXY+DaIacSpERuvAYNXgchIWxZugJEQtEgxX6MaQlg4vN+UOUo4bzQ=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr7723423ybc.288.1646654141326; Mon, 07
 Mar 2022 03:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20220304133556.233983-1-mst@redhat.com>
 <CAFEAcA8Vo4bi_ar-Av7mzbCO6ZFv9pABpyi=0niGPi0U5Vxdvg@mail.gmail.com>
 <f6dc066e-1d34-b132-d559-c306131ff954@redhat.com>
In-Reply-To: <f6dc066e-1d34-b132-d559-c306131ff954@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 11:55:30 +0000
Message-ID: <CAFEAcA_JV_FaLz-ksMwgpW+Xht9J7wjRBb+inuc3DcU_1tsbtg@mail.gmail.com>
Subject: Re: [PULL 00/45] virtio,pc,pci: features, cleanups, fixes
To: Eric Auger <eauger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 10:48, Eric Auger <eauger@redhat.com> wrote:
> Please forgive me for the extra work. Peter do you know if the host is BE?

Yes, it is.

thanks
-- PMM

