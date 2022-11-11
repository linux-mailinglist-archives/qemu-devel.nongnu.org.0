Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A72624F37
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 02:08:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otIVp-0002cX-CO; Thu, 10 Nov 2022 20:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otIVl-0002cM-Mx
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 20:07:13 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otIVg-0007hy-CB
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 20:07:13 -0500
Received: by mail-yb1-xb36.google.com with SMTP id r3so4390655yba.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 17:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCTjhl+IvBB7wv4KSs3k28ipw+0hsnMNXfHHb1Adtq4=;
 b=kLsi5mZj8FfdSmRiksfLDi0cjJeBe/n/GJwh3YEPfT1xE96jDvykSOq/RnNrC/lAQw
 HboBR/xGeGo/8YNd+tUPs0buXMUp5373MSB6FI7+OhQRkFDoT3JYuytFjFM5CWxZKwUM
 CSJXBN5fDn6qNHcfwQRbwSBv4AXoc0sV5XzLS3MDKSxYtc0qCgKqmp7L+MidO/9/+FGD
 jfQnBCwrbGVoo7bErXLkQocgvWsMRhXClDhovSCIW7yYlxeW37oY+ZHZJU7I5t5RF5Y7
 L8r0/xKUo4AEOKmVNKR5coUuko9kh5PvRVNegT506XRQ+q3HZ/k56TvFadKjUhgFSRJ3
 zAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCTjhl+IvBB7wv4KSs3k28ipw+0hsnMNXfHHb1Adtq4=;
 b=F6lhcTrvbyl+9alXDHwFdkVStvObYVoS9aKmWMt7oL7q15hwTKEA79IvmaZnS5kVf8
 hiKUFsVGshqS0nFhXWIYclt53kebFEsnp17F6kc1Sk7WK3nNvn4D96UxHVeCuQDMfaq0
 B74MLBjxD5yEClM33vl7yW648hDSd2qPnDt1lPzS/TgFMszhZumg1bMSUS7wmLeN9pR7
 g12G/uI1H36/AdS2nmCIfpujNe+fxxvzcrE+w8tXv18k2OAnzMxT7H2g+xhT3E4NKMAf
 wAqKLfsuEXC4g4NPai4rKy6YAr539JiIZi9KtCgdbcgIBTGYtkmuTYOCMOvROR4BFXg6
 MI6Q==
X-Gm-Message-State: ACrzQf0IOQhhnN6vVwFFvpRrZDyo3bWcB6gYIh3NmuuGe2O3h6STDH14
 +p5joq56IaS8sooQGWYhQS15FcIPztij1wHmaxc=
X-Google-Smtp-Source: AMsMyM6Ewhqw0TNHlMtzbleI8ZzVKtTTzB+ocBsUsHjsHpdxhBBkkWkhTeO3k3eDVx8gUOzp5eP4T9InIJCZW+mv85I=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr53755487ybh.207.1668128827135; Thu, 10
 Nov 2022 17:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20221111005214.22764-1-tsimpson@quicinc.com>
In-Reply-To: <20221111005214.22764-1-tsimpson@quicinc.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 10 Nov 2022 20:06:55 -0500
Message-ID: <CAJSP0QXYdLGuX=dRUw2y4qn04K-SCn0eWjWfC2T+gnsq2_+OKQ@mail.gmail.com>
Subject: Re: [PULL 00/11] Hexagon bug fixes and performance improvement
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org, 
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Taylor,
QEMU is frozen for the 7.2 release cycle. Only bug fixes can be merged
as the tree is being stabilized. You can find the release schedule
here:
https://wiki.qemu.org/Planning/7.2

Please resend with only the bug fixes needed for the 7.2 release. Thanks!

Stefan

