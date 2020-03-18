Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DD8189A49
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 12:11:07 +0100 (CET)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEWbK-00041k-6Q
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 07:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEWa0-0003Dv-Nm
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 07:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEWZz-0004Xf-H4
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 07:09:44 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEWZz-0004TV-B6
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 07:09:43 -0400
Received: by mail-oi1-x22f.google.com with SMTP id r7so25312489oij.0
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s24WxfQvEVkHP2kPgJUrFy0280e8Ok8/CjojyQnaqVw=;
 b=K13xdzTle0wK+SMLY5+Fekb9A14QZrZtX5SnVbx7ILkO/deXWWhgcIN6wLkdRcjZpq
 8dWHmCBym4bqL+N76nSeIHG5v/LyyzI6M3Ybs0cKb1m+UkMxjB23VgQZf/f4DMSpzsGE
 /9VA4SijRWwBrEY1cDgtpheRJdvxbXk62CvXGLkTmaKUmYWd5+WpMzraQjmVpz6XXIHE
 LAOMNa1xcoYN0W4hGXssM0JxLwx279fXB5CkTeO05mSOF5+zzRv/Pd8wKhRXA37klsrn
 5OlmE2cNJOYbxY+XBJsX7IkTWK9dgurq/W+RusLTfB/JDoq1I4qzgQRokNRIaLMIMk74
 B0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s24WxfQvEVkHP2kPgJUrFy0280e8Ok8/CjojyQnaqVw=;
 b=KyN3vbKTIPgL0LV7QvG9w4sfrcnT4etPQVnFscFKL6v99ZyL4Jpyq3NNF6Jry+OoTi
 tjHJWqTL+JzKZFO0CGk7OXGBnDz+iA2CWhIdFUUFv/YiMJxuGjKZsoaoeZOwifpqEYmI
 O+5ekaReOUSjPOUNa9PZAk1NZ9o+v9dWYoMRtoLYee8MmU+A5aqJuYMeZZcc066mM26I
 IEdW123dC2ghan635Ts9ZOtT9Ycy6CE9PlmAKxQTVEzn2ToJX8suw/q1pRhw4+814CXZ
 KGnqQd99ohNilhJtHOqJYx6ErT+tJq5BvMdmO5zFZlWWk13+ROFUeSFM+ZWOWpPnAfrM
 NhLg==
X-Gm-Message-State: ANhLgQ1FrAI/RCAotWteEHXNTU4ierbfXFuMT5f7Zs1drqBLfRge8Mmc
 eIbqYSUXH0SqzOZHrSkf4cRj+G+H5VnZC9QHDELHcQ==
X-Google-Smtp-Source: ADFU+vv7VvN0etNC4q3zmXCmruXCUAzPOXk7izuMR7rtKfDz38ymu8j78fmQQbQ0BeJl5Bz4MK4Gv72IxPJ8UW3uhDk=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr2608082oib.146.1584529782065; 
 Wed, 18 Mar 2020 04:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPV47zcqvNekcUN=fKu1-dN=Sip3XR3+ohaG22-oNDm1dceJkQ@mail.gmail.com>
In-Reply-To: <CAPV47zcqvNekcUN=fKu1-dN=Sip3XR3+ohaG22-oNDm1dceJkQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Mar 2020 11:09:31 +0000
Message-ID: <CAFEAcA_CeGozr3MUA6N=cMQVXLjoLD0ca-gywm+MLU4unfgwGg@mail.gmail.com>
Subject: Re: Qemu API documentation
To: Priyamvad Acharya <priyamvad.agnisys@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Mar 2020 at 09:55, Priyamvad Acharya
<priyamvad.agnisys@gmail.com> wrote:
>
> Hello developer community,
>
> I am working on implementing a custom device in Qemu, so to implement it I need documentation of functions which are used to emulate a hardware model in Qemu.
>
> What are the references to get it ?

QEMU has very little documentation of its internals;
the usual practice is to figure things out by
reading the source code. What we do have is in
docs/devel. There are also often documentation comments
for specific functions in the include files where
those functions are declared, which form the API
documentation for them.

thanks
-- PMM

