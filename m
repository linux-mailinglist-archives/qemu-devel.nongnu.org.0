Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECF4B29FB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:18:21 +0100 (CET)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYcm-0003O1-KC
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOe-0007S0-Ni
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:44 -0500
Received: from [2a00:1450:4864:20::630] (port=43563
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOY-0005C1-K1
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:41 -0500
Received: by mail-ej1-x630.google.com with SMTP id d10so23858557eje.10
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X17x3KU6beheAfejIvxhbu9cw9YerrgA4KVgbGt68ew=;
 b=rQmg7CbgBRutRfk8t0mnqag3PVCdqByjAuGlk1Z3EC8ea4WVRFABvONDmMUghYTsqf
 SuPwDKh4xU0ED9YGZAweUC14MdJmAJSyp+UQ30uzanlR9Dkpec6UHdR+x2tyzPmjm4dJ
 sjebIYkddasXE5iCN4CFMI8PeSKigpK7z92pa3y0AjFZ4X1kttTXsgw8s1t9oVj6sHnt
 AbFqnlbuVCF9uFxc5oPzhn9wYW1uYOg4emjap/DltWxFM1RIlu6kGR50xL0qsND4mYf2
 hgUJ/OCwuVp+OIK10YixD+Znfx0ceNA6v+ScH2bpTFg1hZPFb5IOOoxcXtZnd2U0mSt5
 kxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X17x3KU6beheAfejIvxhbu9cw9YerrgA4KVgbGt68ew=;
 b=e8QcwvX38kKa3O6mRDKxVN6rTY5dzwqZoR2Pp7hP13b+HeWVlX+ECV/mEH5+uanvh0
 thOsPYe04MlPY1laCwGAkWyZ7nszSP0XgFJ+9OB2tiVyLM8o/ouldWwfGqnHM9yJXjCW
 Ln2eY8hKb0+qmoMwW+n8IyPaSZ+Eut5c6Jy8L6GHMngpnv9kW0z3rxM8bUoqnzJqqCuX
 5X9liwURWEQyDpE9QLIvTDAjV/ZL3qjsTQaecdi9Y0tWFsfTR0rzKuE94172leQAdz5x
 TkMaPVLCLKupuUzhw4xyRY9pPTTDNAANaAfg2zX81AaZI/w0tydNEEsYt0gVxxPuh0Co
 ht3w==
X-Gm-Message-State: AOAM531tQhJYvM0xruXY7yeNkp56EExJMPbNOobbHj1ldXvhGun5FcZ4
 1IczkeozHaRquXzXi/rmhrZVLA==
X-Google-Smtp-Source: ABdhPJyv+JqKE5BPwgHsIW6m0h5uHz+EuyR7j3Nc4CKnOASZyVQsgwT8LihhC0/rDYlW6O+SX1gxNg==
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr2021536ejc.322.1644595402976; 
 Fri, 11 Feb 2022 08:03:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gk6sm5210778ejb.159.2022.02.11.08.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B2FF1FFBF;
 Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/11] scripts/ci: allow for a secondary runner
Date: Fri, 11 Feb 2022 16:03:05 +0000
Message-Id: <20220211160309.335014-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some HW can run multiple architecture profiles so we can install a
secondary runner to build and run tests for those profiles. This
allows setting up secondary service.

[AJB: this is a fairly ugly hack, I'm sure this could be expressed in
a neater way]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 1127db516f..19bfd68f7e 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -69,3 +69,37 @@
         name: gitlab-runner
         state: started
         enabled: yes
+
+    - name: Download secondary gitlab-runner
+      get_url:
+        dest: /usr/local/bin/gitlab-runner-arm
+        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
+        owner: gitlab-runner
+        group: gitlab-runner
+        mode: u=rwx,g=rwx,o=rx
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Register secondary gitlab-runner
+      command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+
+    - name: Install the secondary gitlab-runner service using its own functionality
+      command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
+      register: gitlab_runner_install_service_result
+      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Enable the secondary gitlab-runner service
+      service:
+        name: gitlab-runner-arm
+        state: started
+        enabled: yes
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
-- 
2.30.2


