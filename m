Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D610E1AC592
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 16:24:22 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP5RF-0007dE-Ut
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 10:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5QW-000701-Le
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5QV-0008Fy-NC
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:23:36 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37113)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5QV-0008FU-Br
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 10:23:35 -0400
Received: by mail-oi1-x242.google.com with SMTP id r25so6832263oij.4
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jAf2FbxydNNbQDtHpCp6CvdVyhHMkK3D7xMPYfuX1Y=;
 b=EVLFfVvHGe63c9ijfvkZJjppOrZqwddwk9l/799utYbGTI6D3dcRDydmFRsCBARUO1
 XlbEYdTJpr0Ayb6KPXz9gmQcTJ91L6NY0EH3YRJr5OYeSrWzNJHMXf3xOfMqxyGVFecR
 hG8oQxpNI43zUt//Ky6MBOMEuJQwpgq2C6xrgtZTJ06El2psq3R7LfmF7aNOyJrGGaTi
 RZHnEe6vYzUjp87ubscjaP24Ex1826ENH3G60DXhPlwVw3kvNkwL55uaCZOnktiJj1ql
 tgV4U4VLcWjvS157MItIr8sVPu+DplA8EkG4ee+Q81hhIbxD9BfOcs5TWarAHxaSDN6s
 /5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jAf2FbxydNNbQDtHpCp6CvdVyhHMkK3D7xMPYfuX1Y=;
 b=A8ez3heUa2YtjTZN0/0lfxJnuQ9oQ/GggbpRVbTGpEvbmm/qrHBpFSbE7Jkx+Nyl9g
 IJoAMDk7DNFvQsxymS05UjlyKh+Zmfptpoi1K1BGn0CiNXM0uafa1U6lqKGf4xPiQeaq
 svg8iD3ZoMQsPRNnI1Css78zT8Hh3gvlZiB5vV7g5ZE3g3Cao37dqreCSqMYjvjpAVq1
 LJFOH8DU5RUkOdQ7kEDDvUhl/LKF4v3z2hFkjansbqyZOmZDvUsauJyssqKn9LipGpk9
 V/3waCntir3YDPcb7WrvRfs7XuIM6OBTJ9Imiw1W97yLMDqnIPM+tSHjjJU1cGIB6/UR
 9fXQ==
X-Gm-Message-State: AGi0PuYv+dU+ARh6+BE/4urjYeZmn+eFxW9H/kZtaTybhTgHLQFulr3e
 hYMklknxy9CDFt6+KOt/p7tsA3N4hu7KPgppcFAbxA==
X-Google-Smtp-Source: APiQypIk4addRE2SJUqChD8vkHhnhBg2BVRCEfDw36hlmOqvrh14tmPzR15BwdaFLVEjYuuHXIq0gkS2A+6FDlqasRg=
X-Received: by 2002:aca:170e:: with SMTP id j14mr3040616oii.163.1587047014474; 
 Thu, 16 Apr 2020 07:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-14-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:23:23 +0100
Message-ID: <CAFEAcA9_F3yTHC+Rt6A8NPYjEDESRY6cEAqjYEA1LVV-MDE-JA@mail.gmail.com>
Subject: Re: [PATCH 13/16] target/arm: Reuse sve_probe_page for gather
 first-fault loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This avoids the need for a separate set of helpers to implement
> no-fault semantics, and will enable MTE in the future.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

