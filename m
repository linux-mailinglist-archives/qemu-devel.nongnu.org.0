Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576D2F1D26
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:53:54 +0100 (CET)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1O5-0004IM-FA
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1IM-0008Ky-Ek
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:47:58 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kz1IH-0004u1-S4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:47:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i9so675258wrc.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7PomrZU0jMeuj2pSx76rGsVMpY5/lWRJj77kNrVmTOQ=;
 b=eN3dBxOzR44brDRBdWt3v4cXwY6j30skPdqKuTGRWe/DKoQpXBEbYCNfUfWnxSmOMu
 XBy0JNbmcqHL9/5eTyQHRZK0TylvdmoTIQtrHYnXogIczvSNKQKMvqS2IDa41gSpOeb0
 jCa+KqJnWspIoTNo5Vo72FWylPM+UqOOAL93Y9lhyE/E+JSasH8i1x5Qt4PEIRazuKwW
 47iItS+Yn4S8d/GkngwvwwLE36JBsUFx206rpGBdpMxlY9JBo+PoakQ2ux2Lr1L6YVLy
 T4Sq750nq5cgVMPwYor3Gt9Bgx5x9vcasoQAVPtwwZubrFxLtHxMm/RPTAu3LFDIRtjD
 wmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7PomrZU0jMeuj2pSx76rGsVMpY5/lWRJj77kNrVmTOQ=;
 b=GbAXhYX+t2We1J8z+VvYwp5XaV3Aj4ByfCxNyLPtayh4Pv7mENGvuxes3gU8X8JyJV
 /BXLkzmbdjpMDYEm7X9x1k+0bQ5OnurUYYKrR+OHM8qEkN/1U7smd4lVU+m6ThSFZhwX
 YOM6t5hB1ZaCxauE0OcmIPek9ZzQL/yXsERJ+Ht+Z+L37jAX6MQpeIwrTqUppvWJanm+
 rCrHYFxK3INM0CnVO7V2+62G0LHLHgxj4usK85aCJIUD/1HSFFPwnxMPvlQAOQ5Y5q48
 57gvHkIsTekfcSdeSDO5Oc7KVO1Qj7V2IzB95QhKyKvo0ukLzdIAc2Fh6mLtTJFiQB+p
 DVkQ==
X-Gm-Message-State: AOAM5307PD89kdz+Vp4szUST0hvCbYM8v2hDWbZDEEWfq21gWzKHPxsf
 JMzH/gfcNkhunY3wjiRcwQe2Qg==
X-Google-Smtp-Source: ABdhPJyEoJCuSw+5tRtzaJyx6mVyGEBtWFwj20lKG9ywN4EzrcnynxBCh/RF0f45AqXVj56ADnb/VQ==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr269757wrv.384.1610387272416;
 Mon, 11 Jan 2021 09:47:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm26616wml.34.2021.01.11.09.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:47:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8337D1FF7E;
 Mon, 11 Jan 2021 17:47:50 +0000 (GMT)
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 17:46:36 +0000
In-reply-to: <20210111152020.1422021-2-philmd@redhat.com>
Message-ID: <87o8hvnz5l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Paul Durrant <paul@xen.org>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-arm@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

