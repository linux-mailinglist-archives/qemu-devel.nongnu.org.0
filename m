Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9984A5B54
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:40:07 +0100 (CET)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErW2-0007On-SQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:40:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEr8n-0005ul-9n
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:16:15 -0500
Received: from [2a00:1450:4864:20::632] (port=35401
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEr8h-0003uR-1r
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:16:02 -0500
Received: by mail-ej1-x632.google.com with SMTP id s5so52848558ejx.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=B8AggCu9yhd3aDrQBg9W4LlrmSV2SjPQ5K98gj76ODQ=;
 b=BlvloZ9J2W+W6kXnrt9mFTk1BAfRTjeMWQozDw10ghd5Gcgv1ihTObA3h7t5oqm3J9
 sNvtF6QGlIGpasaURLsqQYiujSYIu1JDMz8F3tXc8N3cgKLHMQmiPUSORuPjY6VDKaLZ
 +dxtu15W/xNTMTWOEhW+4KZLNC7rJRQljVYZhYgqTkmT00FPEujREHSBx2xSMqXZpoeD
 GPvwSwdI1ySLtZHPy+NrO+93nD8Xt4LopUiSOGKRV6VmqzQ/7PUsWmuX2OpnQhnTv485
 Ajm+J5xfxK2D8SVBVnx0t4SMF1oElUOpdJGVIYalnyoE4o4FhwHOhDlDXlnet/GiEmwK
 nOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=B8AggCu9yhd3aDrQBg9W4LlrmSV2SjPQ5K98gj76ODQ=;
 b=UKdMsSACZ//CRGj09s5JCT7kraYR1Eg1L3POGA8UzW3P2rcjTDhAdWNtRosGjg3+nS
 Ovrcae9ARJJeDdpsopuEEWZnViYD8/zQewwcskFDKIwiL56XPSntVGM5c5lYLh7aKbTk
 hE7qg1A0xNGohxc6Jtkg+nZr7MKLcignIoLV77oph8NcBlfvYfCHngo+NDyq7pKfwZCz
 inaRrYTWNr0Ye+1eVhuYFPyMgCd13W/bcn3s+PE5RUIGqThcVnMcTehXCNylCt3sgu8S
 kEXHWmxz1eExiQvPNOG1rtUg+ngbTIvRIWI0PsN9sKGWxDZxGKXeJG19E5lZexD2nPFE
 nZFA==
X-Gm-Message-State: AOAM531+nr3rRK9woByneWQq7yU864BzSJBvRb584sJCf0M2kPM2uBMY
 aFqNelVdq1DYvMOLPT75OXcSqg==
X-Google-Smtp-Source: ABdhPJwgi224qELcZHuIONCV+d5AvqXF42wKODjNCbxud4E3olod/QD5v63zFnzbQ1YwNRG6mGPPgw==
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr20395152ejc.564.1643714155893; 
 Tue, 01 Feb 2022 03:15:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p16sm14542109eja.19.2022.02.01.03.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AA3F1FFB7;
 Tue,  1 Feb 2022 11:15:54 +0000 (GMT)
References: <20220201101911.97900-1-thuth@redhat.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Date: Tue, 01 Feb 2022 11:15:49 +0000
In-reply-to: <20220201101911.97900-1-thuth@redhat.com>
Message-ID: <871r0mzvkl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Support for CentOS 8 has stopped at the end of 2021, so let's
> switch to the Stream variant instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

