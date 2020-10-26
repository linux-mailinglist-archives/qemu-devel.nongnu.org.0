Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8832299479
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:56:05 +0100 (CET)
Received: from localhost ([::1]:49308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6iy-0002kb-Vo
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6JP-0006UD-Jt
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:29:39 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6JN-0001XB-Ko
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:29:38 -0400
Received: by mail-wr1-x442.google.com with SMTP id s9so13569972wro.8
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6R2VxZTPiaSahfUTK2ht+7VHLStg8UB6v4HCMT3qZRQ=;
 b=Jmc36PC/r/b6jP9OjLlg86KmtyrtkwTl0/xdemebAibZO6yXOp2uXA8muINv1Pbh1P
 K/kkIwI6nXenldAvblU/eI6VoXYCiwyWevgonM3m+cOjnEItMwSmBBHOnHFwM8w4VlaI
 5e5SyaWEr+sVGQAAMBV85DxUZL84VIn1yAX/mzZ01KpQds+en3RgGuF7MIjCXjTO7pW2
 76+Iou0PI2RsoPQGMgjWZA7Pdu56ef1zLHE96qCHtx6M982Ya6IkTDeQL0oxAZ++C9Nc
 5uwzyS1OiEokA5qo9pXXDf+rFyDbOD2dImi82e0B0tPCVEli1+w+vcoPvVVZ5oneIJRy
 iQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6R2VxZTPiaSahfUTK2ht+7VHLStg8UB6v4HCMT3qZRQ=;
 b=QCjxyghGbDQz1Hhab5xp24x9FuEvC5J+irYnpTZRxY9eZM/Lrf4rxWcRGjtzb0ghaZ
 kgoF0XOi8OVpB5wMWvQ1KED6SDuZ+LJJWEjfuWl6ikUt4bUnuhhOLjaRHE22k+SwYEx/
 R+XctKv4annokKD8cdcuipLgAcv0wP0qXwhK8Qb7yBvY7UpuYVAh+sgN55ZS5C2eITEt
 NgHndj+xO+NIMz0B12K5srBZqiFIVvakfyRPqVGvv/q9HdMGp944uTBQ9+3TbQLF+PEw
 YuzqtTzTiiGI/lF5eTGZqZtMJYGDGaeF5WqiuSjRCgw8AB96Kcvarc+a2u3HvprCEyAr
 WfLQ==
X-Gm-Message-State: AOAM532nAVW+SUB1FNVPtM94wdl7pTyVjxowTDPEFvDc9IDqfxI6/HQB
 7V4jmXkAdI14c8z5B+LYZ0CpfRG6ME7OhA==
X-Google-Smtp-Source: ABdhPJz7wuAv/zYq60ESVqr+Js6H+8gIwL9x3qo/B8Mi54bUC/SBLz0ZCKClQGyYj65Hxlo1XbGsUw==
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr18864757wrj.268.1603733375300; 
 Mon, 26 Oct 2020 10:29:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm23039292wrv.12.2020.10.26.10.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:29:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3880F1FF7E;
 Mon, 26 Oct 2020 17:29:33 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-13-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/15] s390: remove bios_name
In-reply-to: <20201026143028.3034018-13-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:29:33 +0000
Message-ID: <87imawgaki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

Might be worth mentioning the trixy path from qdev_prop_set_string to
end up in ipl->firmware because it's not obvious just from the diff.
Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

