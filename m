Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A9236ECC4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:52:04 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc81L-0000z7-OC
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc801-0008Rh-LF
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:50:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc7zz-0001DS-0U
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:50:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id t18so9652657wry.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cw61hbwST9sLc+VSI4Gm/Qb3TWC0JxioRAzm3gTOqCU=;
 b=zPjah97b54tdTpx4hIOpkUbk36rpR9LsFS6DToV1xRzKtlhQt561KpHGmD9RBeotpn
 2np5pwJfRBWP9zRW2VG5zquQyJMdQDyNztjscxWq1IanJ6FDCGOnCp+mBYBlPLOmZkBo
 2XmZW7GCleArDtUH2mloh2dYDthRfsnMXAtvFd6NPVmpz7+LFrJoix3yuVVstCEGeKxp
 UrpRZL9TucGaeliqUz9Ggy18WGcW2uY0LEJLFYACoGwL1YnEE7HmUhk//m1jS2wRCHuv
 SpTsSNk/bxlqJYUuTKeIYAsPZUSX6S0f0S8EwVCIyjTRS84H7Zg1d7izOeYW5UzKb2ei
 ns4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cw61hbwST9sLc+VSI4Gm/Qb3TWC0JxioRAzm3gTOqCU=;
 b=DPR29MahNzV2iQ46ve+2iIcikKGtNeYxtTUAvAAt07HGgtExMPsJ9iQflMqVKLILoT
 lE8/8d/O0dbdMe2duTyDBBUvtvaqG6QdmtivEk8nu0udVUsPn23x5iFuGgBK6BSy56D7
 jGkx3pjHtfVAiXYcwv5G5Fb/nERxjuF0ILf+k3JQkZIPueVpuZ06XajZMWXEs+mByaac
 aXl0xPlOXQwQi3E7biQZjZpM28a01t8NDx76hDfmQxMA0+yF2lj2QRfAVRr2jrHhYUBP
 SQ+2OFQfk0XWsPF//UGGNs7rsg2DQmc6eUt5g9qXLsv0HwazqCwx/C9CQ4ShHOB3F50i
 5LiA==
X-Gm-Message-State: AOAM530sLl1wRmc3Rh3q4FMzvPWDugIitnTV9eI64vjHTb3vY4Z2FIKR
 MNxKWn0fw1/5Hp4nh/uql9gwEA==
X-Google-Smtp-Source: ABdhPJyET3DrUWGr35oZQiWAIZpHb12LFe/xbwIl/c7YnGAp1dsSK5/4ghBRXyta1CRnAJWayu2mWg==
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr159412wrz.105.1619707837189;
 Thu, 29 Apr 2021 07:50:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v13sm5337904wrt.65.2021.04.29.07.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 07:50:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56D871FF7E;
 Thu, 29 Apr 2021 15:50:35 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-3-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 02/12] accel: Introduce 'query-accels' QMP command
Date: Thu, 29 Apr 2021 15:50:25 +0100
In-reply-to: <20210415163304.4120052-3-philmd@redhat.com>
Message-ID: <87tunpw3es.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

