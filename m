Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7C344DC3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:52:47 +0100 (CET)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOjO-0004jD-EZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOhT-0003YC-6n
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:50:47 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOOhR-0000b0-Cg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:50:46 -0400
Received: by mail-ej1-x630.google.com with SMTP id u21so4764253ejo.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wVhNBeVC7VG5jGcdkLsIYzwo1o1yWVW92RmFOpyZ2bw=;
 b=mIXuyGymEHWyVKOQFXj2BqwIthdbImOzkLtPhCACCbOOBLa42iNECLAhhWP7dytoMv
 5XN9Uz8nKpf6EuXkqWhdxHbuMqaSqgNdtn4M8IblYPlIr3382yEuADxEs6k6uy8LRG61
 CADhAzLpSDAcYXgduoZKojBcvFZzpRUgun3a3iJs8pa9Qfi/v77zrt3yrCzrTskrELpB
 2BHpUYKfUoDvorMSyfaR8ssAaRdZh0vK+4otTHyJpAk809qiruk6IovctDzIdpoHZdnc
 UU/koVvWLZ1OvZwaXQpYn8FkJrshSiE/e50aUsjeK3+5UDHuNVMmpQUJqL1YHhSMFahT
 vUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wVhNBeVC7VG5jGcdkLsIYzwo1o1yWVW92RmFOpyZ2bw=;
 b=dzs457k4pmpgPRmzLXn80EpWVo20/gGg0pnNmsXtb+wYGC9Lj0j/oENVPTkUrML8jD
 9YWKGXq25P43+XOA+T9CCP16Qkem4jG8CGOwB5GT4SHfQb74ADl6GWbzxgxJHJRSvYmb
 Q0lc7OTlAhPqi0X0SG5PvsvAwI0/gbeKZQaqMYAA/PlxQ2J6E52PNX1VzoDQCeba94fX
 6oZiY68a+TLw+D6CkdirvdTYIJ/XK2fz0VaeMmdJgOW99CAukEBgNjA3Xog5f+8iLy/f
 vWwl4aBwv4sBjK2KvNvRNxshXCfeg9uZO9Q6FYeVXI0u+WWZ2hB1EoDbdKgqgf4Kt3sO
 7djg==
X-Gm-Message-State: AOAM532Ozfq0Hw0ZFCLK4tADW2daiCRrnaQqv2mEiv+HAmanr+9nJCcM
 HkBlqzzFYBUZnSv5N2idbxC2rA==
X-Google-Smtp-Source: ABdhPJxQLK0s7bZADfDx90EMfjI+S3fRIYcmr/1XWMVRVEF3efq25pgr0qxnAjOGTX47qnV+2ONz0g==
X-Received: by 2002:a17:906:4e57:: with SMTP id
 g23mr975687ejw.47.1616435443688; 
 Mon, 22 Mar 2021 10:50:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id jx22sm9906553ejc.105.2021.03.22.10.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:50:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8BCB1FF7E;
 Mon, 22 Mar 2021 17:50:41 +0000 (GMT)
References: <20210319202335.2397060-1-laurent@vivier.eu>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 0/6] iotests: fix failures with non-PCI machines
Date: Mon, 22 Mar 2021 17:50:30 +0000
In-reply-to: <20210319202335.2397060-1-laurent@vivier.eu>
Message-ID: <877dlzjcwe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Laurent Vivier <laurent@vivier.eu> writes:

> Tests are executed using virtio-*-pci even on a non PCI machine..
> .
> The problem can be easily fixed using the virtio aliases.
> (virtio-*), to run virtio-*-ccw on s390x and virtio-*-device on.
> m68k..
> .
> A first attempt was tried with virtio-*-ccw by detecting.
> the machine type, this series removes it to use the aliases that.
> are a cleaner approach..

Queued to for-6.0/fixes-for-rc1, thanks.

--=20
Alex Benn=C3=A9e

