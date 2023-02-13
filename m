Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F76946FF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYt0-0007yh-57; Mon, 13 Feb 2023 08:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRYsy-0007yZ-Fy
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:28:48 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRYsw-0007Iu-Tu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:28:48 -0500
Received: by mail-pl1-x629.google.com with SMTP id v23so13504126plo.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dVHNvfTYgmLutmySWRj2fl3iDc69qUjX5vQI6jXZ444=;
 b=Pi+XEGhQZYUez7VN1VO0WtdKOl00Kv+JuS0qgBhHkpKV0G9bQwEYac9bzFrOBmbEJI
 Wt3ZxM9cbHDM2OQpB9QjNOCDVB2u9Kq2IS0tzYCnyG3Sg60Bnh6SvY1qyYPOLxJSnJH9
 hnYCNCFnpp7tZ3yYzFvZvjTKoHWkQlMgDSgwYRhBDWbgaDhuGurnGqhdyyIBcBwAiV2i
 7Dy3k6yq2cRHhQt7WaHlGyGVbxgHBI50YSuAQlyJJnnVeGYB/LHi7P9PC6nE30hlatN5
 LkWzczQStRt2B2xnO2j0eIypIOuQxE+lHdjOeIJzyf9a8CE0dqbn0ZMcosuxZcdDd9WE
 8tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dVHNvfTYgmLutmySWRj2fl3iDc69qUjX5vQI6jXZ444=;
 b=NonXWAL91Um4py8r0OD00pwoqTiA7zlbtiHC6Xaa/kuFclzZRk39MKdSa8eHwzpZXL
 bFzSzLk9ASws/20fLQsEK44MF+oOv9W/CXqq3jS2D0rOpbJVVRQ+tirm3/DmqBIJx+y1
 eE+Sn8qLwN3xpNpSsQJ8J9fgJmVcp6foT7y8CyO4dx2zf87h9p/RoJAoWexEE3L5dmwd
 7gTgKni7EFcp1jOG7R0sF6XLOQmuRIfVEuDs+4+3X5TU1qLenGvNjc22sfREl5VLnxJC
 nPvqJPNAn0i8MamG9IkxxQJavKtYVxY2i55SGvNB+iCLI4XE7DqX5VJYxFl+X1CygJ47
 cxMw==
X-Gm-Message-State: AO0yUKXx74Bv+MdYV2CjjWkAt/cjvkUKsutDOKvN280s67ii9AVbh6xC
 Ln/BtaOBFkwcp6lFwxMxti8TGEuEYw60UuzFMYUagg==
X-Google-Smtp-Source: AK7set8bkFJJTqSVky1iT2dUC23kZXvYYHrJvO4RhNt35Jyr9YNzRmP/EsVCCb4XoOCLcx1uRw9VWVDNTib1bq/qb1U=
X-Received: by 2002:a17:90a:74c7:b0:233:d42f:a464 with SMTP id
 p7-20020a17090a74c700b00233d42fa464mr1180368pjl.137.1676294925274; Mon, 13
 Feb 2023 05:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20230123201431.23118-1-anjo@rev.ng>
In-Reply-To: <20230123201431.23118-1-anjo@rev.ng>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 13:28:34 +0000
Message-ID: <CAFEAcA_WiWwMVt8GQa8AHW5pO57W0NrHaGYJzoj8UVGyvTxmVQ@mail.gmail.com>
Subject: Re: [PATCH] block: Handle curl 7.55.0, 7.85.0 version changes
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, ale@rev.ng, kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 23 Jan 2023 at 20:15, Anton Johansson via <qemu-devel@nongnu.org> wrote:
>
> * 7.55.0 deprecates CURLINFO_CONTENT_LENGTH_DOWNLOAD in favour of a *_T
>   version, which returns curl_off_t instead of a double.
> * 7.85.0 deprecates CURLOPT_PROTOCOLS and CURLOPT_REDIR_PROTOCOLS in
>   favour of *_STR variants, specifying the desired protocols via a
>   string.
>
> Signed-off-by: Anton Johansson <anjo@rev.ng>

Block folks -- this patch has been reviewed, are you going to
pick it up (with the Resolves: line added) ?

I'm interested because one of the machines I use has just updated
to the new libcurl and so QEMU no longer compiles there because
of the deprecation warnings :-)

-- PMM

