Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5E4D2D9F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:05:50 +0100 (CET)
Received: from localhost ([::1]:56826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRu8b-0004yR-GD
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:05:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRu6t-0004H9-Ip
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:04:03 -0500
Received: from [2a00:1450:4864:20::62a] (port=33634
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRu6r-0004Xc-PZ
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:04:03 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kt27so4234354ejb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5JHu5o4zsVC4wYCL4Tvl6dJqdB2EofLz8L7lNn/cGVo=;
 b=jH1Ez86gqlrt9M1z1ddqJDmQZ0affM1k3/odkX15mtW7C716a++2kXMku/rFHg5rPI
 oqx3EnvkEXqYCF8hUuj5sJB4hWhwLqR6eR+tNZ4H+VP5HI1+j4sJ4J38BxddMsCCQ8Uq
 qQKvigWiu7hIMcT21mph99vNfXlUej4VfAabyvpgOt+lrXhxBU0oTt8gPUBfxL0+nOES
 yALoQ5q3YWQuruzpzfBtghpajVWvlsq/CprwB3qqj59nQzvn1NO/wI1TfnDdbU9KRiNi
 bXb9Ne20pz/jlArpS3gQBHr0ulNB86/unt30S2PoFtsksOFXZjgkQTmhj45RBlx5b/RA
 96oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5JHu5o4zsVC4wYCL4Tvl6dJqdB2EofLz8L7lNn/cGVo=;
 b=QUCR/zZ4Za4xxsKtZIOamwsmK3Ee+dLCZrRWYW/U8H11ymXZ0/iecdsuVXKUKe6mnu
 QVHy2IMQ4unJ0Cp+aok7pIR7EsygdwLDgQ6Fhzdv0/BHcwKgyCDu5zyAF8QGiSv3Q0BZ
 UeQalChlW6lUbbK2//PuO6t9PsoePKb+a2+ZZbSEGnMHTAI5aHvCglwGl+AkJqVLVKF4
 JH4sbKjNWzA9is410bNJEtQsp7Ana7YvmFaAJfaMeI67GsDV9J9phNQ7pttALNMF2ojH
 UsApAv5ryUmguCNVR6xgCwCVdaWbA+qgiG2hHMPnn2LfDGwAXKUV5PIQcOOs0LcLMquM
 VI+Q==
X-Gm-Message-State: AOAM5319dF/ksxdBaT3aSyedXF/H9cKEoJXjnInMXIJVBmrGFyB+h36v
 PuRQi4I1JcXzJWhr+a83xIhj79cpww5IZkrJ2z5Rww==
X-Google-Smtp-Source: ABdhPJx5m6dveO23hfbXnwuMnemUC11B5Y2bAxHiITTTdKkt8CHLApUjRDI1tEf+6mbagWwz1a3dqQo8SiFq/1TvURk=
X-Received: by 2002:a17:907:2d29:b0:6db:2b1f:333a with SMTP id
 gs41-20020a1709072d2900b006db2b1f333amr12393955ejc.704.1646823840036; Wed, 09
 Mar 2022 03:04:00 -0800 (PST)
MIME-Version: 1.0
References: <20220207070233.2632953-1-ani@anisinha.ca>
 <20220207070233.2632953-2-ani@anisinha.ca>
 <c95e764d-60b5-c25a-f32c-33f21fa6724c@oracle.com>
In-Reply-To: <c95e764d-60b5-c25a-f32c-33f21fa6724c@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 9 Mar 2022 16:33:48 +0530
Message-ID: <CAARzgwyd4fhMVEzOodyg8C759_0zgidBJP=o82XPaAWRiVf-aA@mail.gmail.com>
Subject: Re: [PATCH v16] ACPI ERST: specification for ERST support
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 1, 2022 at 8:05 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> Hi, just wondering when this is targeted for merge?

It has merged to master.

$ git log acpi_erst.rst
commit 0ef0506e559612edd10fe45dfd2f349c224601a1
Author: Eric DeVolder <eric.devolder@oracle.com>
Date:   Wed Feb 23 20:03:16 2022 +0530

    ACPI ERST: specification for ERST support

    Information on the implementation of the ACPI ERST support.

    Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
    Acked-by: Ani Sinha <ani@anisinha.ca>
    Message-Id: <20220223143322.927136-2-ani@anisinha.ca>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

