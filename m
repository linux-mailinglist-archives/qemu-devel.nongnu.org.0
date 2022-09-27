Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE05ECA74
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:06:23 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odE2I-0000tE-Mr
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odClf-0002sU-4O
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:45:08 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:41971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odClX-0007Xq-Dh
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:45:06 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-346cd4c3d7aso104181777b3.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e+w+HqdWFfWmF3C9WbjQjics6dA7q3fEVM4Nn/4Id+k=;
 b=L3eLFdEpUl+psCNO2WXQHtHJ/zxktgq3LQ2eoRIAql8nrAP827+YXhuqV/F28npDt9
 HSmzYKcMoVzKQMaqTNEYPGCPmW8E/ZBNzT8wp7KS2iU9p+CdT+pTCnehsLAHPph5N0o+
 WwMw7285Cr7Wc/EDFmIXsWrJGJknUq1Ju2EXEUapljCkB5AAmIgw1qzteHy53q/PzouV
 3rQ9aRWZGlzP68tepL2kVGSzsF0jqnXjK/Y4ol8WDSfzedPJv1RZFjI5MAQlF8Qks7Pn
 J+YWZDpUeOMQvyYUvpUn3eoBvdZdOBP5nAGzDvDDQh8lxH63/gM5fQXh1xis53TReQW4
 Cszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e+w+HqdWFfWmF3C9WbjQjics6dA7q3fEVM4Nn/4Id+k=;
 b=TTnS3UASxk/zp3gBmKXkgQ0gTAm5/PXHgayEoexu/9XLqFjimJUNTSpw0KDdpCBTTh
 cxL7YMKNpdXh7p9O46fSq0EiOgJoKS1Pdp/EHJ0TtlhjlmQVZARIWCTmsrqtUlNm/fQZ
 oI40kMkW0wSdgJk73EfbFhyWUiPsbCE7J0UMl8n81SlyaS7NNTXCQyqX7xk9tD6tEI56
 0bPGvNYuOGQv8oga7E9yWOkAliIqOOLy4PcnPbwFRmJ9/ZMf0UJowKhcWJB2tO7SA3bd
 EdYPPtSQn4byN77gHIDhpTV73Cu/td+2hLoZt+M7H9VM4f6pKrH1zi/d7Zlutzw4Q6do
 Gz1Q==
X-Gm-Message-State: ACrzQf30JQugA4OectacTmqVrRPYV5Hj7CNangNuOSWWMyoOG+9m3SXd
 8BTTPhHuAVdErCf6/IKA4LqQR2fka3Xe9BoS4W8=
X-Google-Smtp-Source: AMsMyM7+0r+kKvl0f5Cb6xQHpuuCtTtK+xld5jbyY1phB4aVcvF/2EsHo51hSs/OJu+Mwh8BmNEvzbryMCEtJJ3gDao=
X-Received: by 2002:a81:6a54:0:b0:345:4292:4dfe with SMTP id
 f81-20020a816a54000000b0034542924dfemr26074285ywc.62.1664293497054; Tue, 27
 Sep 2022 08:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
In-Reply-To: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 27 Sep 2022 11:44:45 -0400
Message-ID: <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
> now that Gitlab is giving us pressure on the amount of free CI minutes, I
> wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI
> dashboard again? We could add the jobs to our .cirrus-ci.yml file instead,
> like we did it in former times...
>
> Big advantage would be of course that the time for those jobs would not
> count in the Gitlab-CI minutes anymore. Disadvantage is of course that they
> do not show up in the gitlab-CI dashboard anymore, so there is no more
> e-mail notification about failed jobs, and you have to push to github, too,
> and finally check the results manually on cirrus-ci.com ...

My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
to run the cirrus-run container image that forwards jobs to Cirrus-CI.
So GitLab CI resources are consumed waiting for Cirrus-CI to finish.

This shouldn't affect gitlab.com/qemu-project where there are private
runners that do not consume GitLab CI minutes.

Individual developers are affected though because they most likely
rely on the GitLab shared runner minutes quota.

Does GitLab CI support some kind of async job so a container doesn't
have to monitor Cirrus-CI for the duration of the tests? I guess it
would require a job like the cirrus-run job, except a webhook signals
completion and therefore the GitLab CI container doesn't need to wait
around.

Stefan

