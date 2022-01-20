Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49E495550
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:17:57 +0100 (CET)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdsa-0000cc-8v
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAYND-0000PE-VT
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:25:12 -0500
Received: from [2a00:1450:4864:20::335] (port=53999
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAYN5-0002oE-R7
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:25:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id n8so12415846wmk.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 06:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gh+EHsDLbp6YSi3WO3UFEfeWrhSHyzXi6XmtvM+HbME=;
 b=EWFJuMEOwj9Jh9eJCoDS9SNH64sgMOaXMypzeelmAyEMHtFFfeGMQSzN8WdslH514R
 HQRCKkuxi0OKdtHt5Q46XTRvNC+5ZGNIhl+wRp/cVoxqL0wmHObMH9Ue+qpdf9qlmmXj
 pYn0BF4Mk7XEJEafkuU2cJ0tLpLrMspNjv1mbjkT9urb5ISSwVlRBrwCPgCnUyCWdQjd
 UvnQQNVLiGfC4qSLG6xRpouB21CWqj+3xbCfzHHGkYjj83JNO1l1Leq55lqKpniIfTYk
 d9iFylUCxANIqShEUPs3U0D9hn5VDjiM+MKwjbb3RKwb8fGG4ipMzdhWkwG1Gzv8boeR
 IZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gh+EHsDLbp6YSi3WO3UFEfeWrhSHyzXi6XmtvM+HbME=;
 b=SyGENLnoP336gV77RI7EiMKaTapeiZ0WFqaTuocMyJOCOnMVT2TTZfoHhtV/6UUjYk
 FnGEoM1VlmkT9XKf+IsXZS813Kq5KPeECIY00uZOcA0H7HUMt3ElENQ4E/249dhgylUK
 4+2fi1WUCWzlN3niSRZUZUvx5QNIjOlWhhCfmW2bh3OTRdC4HFw0e5W4d8x/6Bft22kj
 IHQvO1qPiZEKzu2o30Ym5IbDrsd9M7uIH02Wz264DaQxRFyVlNfTittHN7p8B/vf0Jrm
 +6gCA6r5+UvEBUqGwpYODnbl5EohCx+swf89p+nQCQtTF0wY3XNBAk3+q/AHU+4mRI+U
 fqsw==
X-Gm-Message-State: AOAM530KrCJHf3rje686b1tNfuOzQZ81yf3L83+lL1akPB4KXMC+g1vd
 v7Y1lN172gXIX6KjvSc2JcBo8Q==
X-Google-Smtp-Source: ABdhPJzkqTAnsAlhAbzy20eIOsgemMu7Evw8VyWOb7dydkcBkLzfytcxcQqgdjU6NL1VfOfk4oNosg==
X-Received: by 2002:a5d:6690:: with SMTP id l16mr4213371wru.468.1642688633675; 
 Thu, 20 Jan 2022 06:23:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm3531455wrp.55.2022.01.20.06.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 06:23:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC4C41FFB7;
 Thu, 20 Jan 2022 14:23:51 +0000 (GMT)
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-2-eric.auger@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/6] tests/qtest/vhost-user-test.c: Use vhostforce=on
Date: Thu, 20 Jan 2022 14:23:46 +0000
In-reply-to: <20220118203833.316741-2-eric.auger@redhat.com>
Message-ID: <87v8ye7afc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 mst@redhat.com, eesposit@redhat.com, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eric.auger@redhat.com> writes:

> -netdev vhost-user,vhostforce is deprecated and vhostforce=3Don
> should be used instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

